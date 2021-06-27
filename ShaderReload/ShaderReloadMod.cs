using System;
using System.Collections.Generic;
using System.IO;
using System.Text.RegularExpressions;
using BepInEx;
using UnityEngine;

namespace ShaderReload
{
    [BepInPlugin("pjb3005.shader_reload", "ShaderReload", "0.1.0")]
    public sealed class ShaderReloadMod : BaseUnityPlugin
    {
        // CHANGE THIS CONSTANT
        private const string UnityShaderDir = @"C:\Users\Pieter-Jan Briers\Documents\RainWorld Shader Fuckery\Temp";

        private static readonly Regex CompiledShaderNameRegex = new Regex(@"Compiled-(.+)-.shader");

        private readonly Queue<string> _shaderReloadQueue = new Queue<string>();

        // ReSharper disable once PrivateFieldCanBeConvertedToLocalVariable
        private readonly FileSystemWatcher _fsWatcher;
        private RainWorld _rainWorld;

        public ShaderReloadMod()
        {
            On.RainWorld.Start += OnRainWorldOnStart;

            _fsWatcher = new FileSystemWatcher(UnityShaderDir, "*.shader");
            _fsWatcher.Created += OnFileSystemChange;
            _fsWatcher.Renamed += OnFileSystemChange;
            _fsWatcher.Changed += OnFileSystemChange;
            _fsWatcher.EnableRaisingEvents = true;
        }

        private void Update()
        {
            ReloadShaders();
        }

        private void OnRainWorldOnStart(On.RainWorld.orig_Start orig, RainWorld self)
        {
            orig(self);

            _rainWorld = self;

            foreach (var fName in Directory.GetFiles(UnityShaderDir))
            {
                if (!CompiledShaderNameRegex.IsMatch(fName))
                    continue;

                lock (_shaderReloadQueue)
                {
                    _shaderReloadQueue.Enqueue(fName);
                }
            }
        }

        private void OnFileSystemChange(object sender, FileSystemEventArgs e)
        {
            Debug.Log($"SHR: File changed on FS: {e.Name}");

            var nameMatch = CompiledShaderNameRegex.Match(e.Name);
            if (!nameMatch.Success)
                return;

            lock (_shaderReloadQueue)
            {
                _shaderReloadQueue.Enqueue(e.Name);
            }
        }

        private void ReloadShaders()
        {
            // ReSharper disable once InconsistentlySynchronizedField
            if (_rainWorld == null || _shaderReloadQueue.Count == 0)
                return;

            Debug.Log("SHR: Reloading shaders...");

            Dictionary<string, Shader> replacementShaders = new();

            lock (_shaderReloadQueue)
            {
                while (_shaderReloadQueue.Count != 0)
                {
                    var shader = LoadSingleShader(_shaderReloadQueue.Dequeue());
                    if (shader != null)
                        replacementShaders[shader.name] = shader;
                }
            }

            if (replacementShaders.Count == 0)
                return;

            Debug.Log($"SHR: {replacementShaders.Count} shaders to replace");

            HashSet<FShader> toUpdateShaders = new();

            foreach (var (name, fShader) in _rainWorld.Shaders)
            {
                if (replacementShaders.TryGetValue(fShader.shader.name, out var replacement))
                {
                    Debug.Log($"SHR: RW shader {name} needs updating (shader {fShader.shader.name})");

                    toUpdateShaders.Add(fShader);
                    fShader.shader = replacement;
                }
            }

            Debug.Log("SHR: Updating FFacetRenderLayers...");

            var count = 0;
            foreach (var fNode in AllFNodes())
            {
                if (fNode is FFacetNode fFacetNode && toUpdateShaders.Contains(fFacetNode.shader))
                {
                    count += 1;
                    ReloadFacetRenderLayerMaterial(fFacetNode._renderLayer);
                }
            }

            Debug.Log($"SHR: Updated {count} FFacetRenderLayers with new shaders.");
            Debug.Log("SHR: Done reloading shaders");
        }

        private static void ReloadFacetRenderLayerMaterial(FFacetRenderLayer layer)
        {
            var rq = layer._material.renderQueue;
            Destroy(layer._material);
            layer._material = new Material(layer._shader.shader);
            layer._material.mainTexture = layer.atlas.texture;
            layer._material.renderQueue = rq;
            layer._meshRenderer.renderer.sharedMaterial = layer._material;
        }

        private IEnumerable<FNode> AllFNodes()
        {
            foreach (var fStage in Futile._stages)
            {
                foreach (var child in ContainerFNodes(fStage))
                {
                    yield return child;
                }
            }
        }

        private IEnumerable<FNode> ContainerFNodes(FContainer container)
        {
            foreach (var childNode in container._childNodes)
            {
                yield return childNode;

                if (childNode is FContainer childContainer)
                {
                    foreach (var childContainerChild in ContainerFNodes(childContainer))
                    {
                        yield return childContainerChild;
                    }
                }
            }
        }

        private static Shader LoadSingleShader(string fName)
        {
            var fullPath = Path.Combine(UnityShaderDir, fName);
            if (!File.Exists(fullPath))
            {
                Debug.Log($"SHR: Unable to locate compiled shader {fName}, skipping");
                return null;
            }

            Debug.Log($"SHR: Loading shader {fName}");

            try
            {
                var material = new Material(File.ReadAllText(fullPath));
                var shader = material.shader;

                Debug.Log($"SHR: Shader name {fName} -> {shader.name}");

                return shader;
            }
            catch (Exception e)
            {
                Debug.Log($"SHR: Failed to load {fName}:\n{e}");
                return null;
            }
        }
    }
}
