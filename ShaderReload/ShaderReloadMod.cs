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

        private readonly Dictionary<FShader, FShaderReg> _shaderRegs = new();
        private bool _enabled = true;

        public ShaderReloadMod()
        {
            On.RainWorld.Start += OnRainWorldOnStart;

            if (Directory.Exists(UnityShaderDir))
            {
                _fsWatcher = new FileSystemWatcher(UnityShaderDir, "*.shader");
                _fsWatcher.Created += OnFileSystemChange;
                _fsWatcher.Renamed += OnFileSystemChange;
                _fsWatcher.Changed += OnFileSystemChange;
                _fsWatcher.EnableRaisingEvents = true;
            }
        }

        private void Update()
        {
            if (Input.GetKeyDown(KeyCode.F9))
            {
                _enabled = !_enabled;

                Debug.Log(_enabled ? "SHR: ENABLING loaded shaders" : "SHR: DISABLING loaded shaders");

                foreach (var (fShader, reg) in _shaderRegs)
                {
                    fShader.shader = _enabled ? reg.Replacement : reg.Original;
                }

                UpdateFacetLayers(_shaderRegs.Keys);
            }

            ReloadShaders();
        }

        private void OnRainWorldOnStart(On.RainWorld.orig_Start orig, RainWorld self)
        {
            orig(self);

            _rainWorld = self;

            if (!Directory.Exists(UnityShaderDir))
            {
                Debug.Log($"SHR: Shader dir {UnityShaderDir} does not exist");
                return;
            }

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
            {
                Debug.Log("SHR: No shaders to actually replace, done");
                return;
            }

            Debug.Log($"SHR: {replacementShaders.Count} shaders to replace");

            HashSet<FShader> toUpdateShaders = new();

            foreach (var (name, fShader) in _rainWorld.Shaders)
            {
                if (replacementShaders.TryGetValue(fShader.shader.name, out var replacement))
                {
                    Debug.Log($"SHR: RW shader {name} needs updating (shader {fShader.shader.name})");

                    toUpdateShaders.Add(fShader);

                    if (!_shaderRegs.TryGetValue(fShader, out var reg))
                    {
                        reg = new FShaderReg();
                        reg.Original = fShader.shader;
                        _shaderRegs.Add(fShader, reg);
                    }

                    reg.Replacement = replacement;

                    if (_enabled)
                    {
                        fShader.shader = replacement;
                    }
                }
            }

            UpdateFacetLayers(toUpdateShaders);

            Debug.Log("SHR: Done reloading shaders");
        }

        private static void UpdateFacetLayers(ICollection<FShader> shaderToUpdate)
        {
            Debug.Log("SHR: Updating FFacetRenderLayers...");

            var count = 0;
            foreach (var fNode in AllFNodes())
            {
                if (fNode is FFacetNode fFacetNode && shaderToUpdate.Contains(fFacetNode.shader))
                {
                    count += 1;
                    ReloadFacetRenderLayerMaterial(fFacetNode._renderLayer);
                }
            }

            Debug.Log($"SHR: Updated {count} FFacetRenderLayers with new shaders.");
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

        private static IEnumerable<FNode> AllFNodes()
        {
            foreach (var fStage in Futile._stages)
            {
                foreach (var child in ContainerFNodes(fStage))
                {
                    yield return child;
                }
            }
        }

        private static IEnumerable<FNode> ContainerFNodes(FContainer container)
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

        private sealed class FShaderReg
        {
            public Shader Original;
            public Shader Replacement;
        }
    }
}
