using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using BepInEx;
using MonoMod.RuntimeDetour;
using RWCustom;
using UnityEngine;
using Debug = UnityEngine.Debug;

namespace Sharpener
{
    [BepInPlugin("pjb3005.sharpener", "Sharpener", "0.1.0")]
    public partial class SharpenerMod : BaseUnityPlugin
    {
        private delegate void SetResolution(int width, int height, bool fullscreen);

        public static SharpenerMod Instance { get; private set; }

        private static SetResolution _trampolineSetResolution;
        private static NativeDetour _detourSetResolution;
        private static NativeDetour _detourWidth;
        private static Func<int> _trampolineWidth;
        private static NativeDetour _detourHeight;
        private static Func<int> _trampolineHeight;
        private static NativeDetour _detourMousePosition;
        private static Func<Vector3> _trampolineMousePosition;

        private RenderTexture _upscaler;
        private RenderTexture _gameRenderTexture;

        private bool _badCameraDisabled;
        private Futile _futile;

        // Resolution the game wants/expects.
        private IntVector2 _gameRes = new IntVector2(600, 400);

        // Real resolution of the game.
        private IntVector2 _realRes;

        // Resolution for full-screen.
        private IntVector2 FullscreenRes => _cfgFullScreenRes.Value.Resolution;
        private ResolutionCfg _defaultFullscreenRes;

        private IntVector2 TargetHighRes =>
            Screen.fullScreen
                ? FullscreenRes
                : ScalingEnabled
                    ? WindowOverrideSize
                    : _gameRes;

        private bool ScalingEnabled => _cfgOverrideWindow.Value || Screen.fullScreen;
        private bool GameResBackbuffer => !ScalingEnabled || Mode == RenderMode.GameDefault;
        private bool IsUpDown => ScalingEnabled && Mode == RenderMode.UpDown;

        private readonly Material _blitShader;

        private const string BlitShaderSource = @"
Shader ""Tutorial/Basic"" {
        Properties {
            _MainTex (""Base (RGB)"", 2D) = ""white"" { }
        }
        SubShader {
            Pass {
                Blend Off
                Cull Off
                ZTest Always
                SetTexture [_MainTex] {
                    Combine texture
                }
            }
        }
    }
";

        private RenderMode Mode
        {
            get => _cfgMode.Value;
            set => _cfgMode.Value = value;
        }

        public SharpenerMod()
        {
            try
            {
                _blitShader = new Material(BlitShaderSource);

                _defaultFullscreenRes = new ResolutionCfg(Screen.resolutions
                    .OrderBy(r => r.width)
                    .ThenBy(r => r.height)
                    .Last()
                    .ToVec());

                Instance = this;

                _upscaler = new RenderTexture(1, 1, 0);
                _upscaler.filterMode = FilterMode.Bilinear;

                On.Futile.Init += FutileOnInit;
                On.RainWorld.Start += RainWorldOnStart;

                _detourSetResolution = new NativeDetour(
                    (SetResolution) Screen.SetResolution,
                    (SetResolution) HookScreenSetResolution);

                _trampolineSetResolution = _detourSetResolution.GenerateTrampoline<SetResolution>();

                _gameRenderTexture = new RenderTexture(1, 1, 24);

                // Screen.get_Width
                var getWidth = typeof(Screen).GetProperty(nameof(Screen.width))!.GetGetMethod();
                MakeNativeHook(
                    getWidth,
                    nameof(HookScreenWidth),
                    out _trampolineWidth,
                    out _detourWidth);

                // Screen.get_Height
                var getHeight = typeof(Screen).GetProperty(nameof(Screen.height))!.GetGetMethod();
                MakeNativeHook(
                    getHeight,
                    nameof(HookScreenHeight),
                    out _trampolineHeight,
                    out _detourHeight);

                // Screen.get_MousePosition
                var getMousePosition = typeof(Input).GetProperty(nameof(Input.mousePosition))!.GetGetMethod();
                MakeNativeHook(
                    getMousePosition,
                    nameof(HookMousePosition),
                    out _trampolineMousePosition,
                    out _detourMousePosition);

                InitConfig();
            }
            catch (Exception e)
            {
                Shared.MessageBox(e.ToString());
            }
        }

        private void RainWorldOnStart(On.RainWorld.orig_Start orig, RainWorld self)
        {
            orig(self);

            try
            {
                // Load all our custom shaders
                Debug.Log("Sharpener: Loading fixed shaders");

                var shaders = new Dictionary<string, Shader>();

                var assembly = typeof(SharpenerMod).Assembly;
                foreach (var resource in assembly.GetManifestResourceNames())
                {
                    if (!resource.StartsWith("Sharpener.Shaders.") || !resource.EndsWith(".shader"))
                        continue;

                    using var stream = assembly.GetManifestResourceStream(resource);
                    using var sr = new StreamReader(stream, Encoding.UTF8);

                    var shaderCode = sr.ReadToEnd();
                    var material = new Material(shaderCode);
                    var shader = material.shader;

                    shaders.Add(shader.name, shader);
                }

                Debug.Log($"Sharpener: {shaders.Count} shaders to replace...");

                var count = 0;
                foreach (var fShader in self.Shaders.Values)
                {
                    if (shaders.TryGetValue(fShader.shader.name, out var replacement))
                    {
                        fShader.shader = replacement;
                        count += 1;
                    }
                }

                Debug.Log($"Sharpener: Replaced {count} shaders");
            }
            catch (Exception e)
            {
                Shared.MessageBox(e.ToString());
            }

            InitUI();
        }

        public void Update()
        {
            // Rain World has an extra camera in the bottom left corner.
            // It doesn't do anything except break rendering when going off-screen and waste CPU/GPU.
            // So we disable it as soon as we can.
            if (!_badCameraDisabled)
            {
                foreach (var camera in Camera.allCameras)
                {
                    Debug.Log($"Sharpener: CAMERA: {camera.name}, {camera.tag}, {camera.targetTexture}");

                    if (!camera.CompareTag("MainCamera"))
                    {
                        Debug.Log("Sharpener: Disabling bad camera");
                        camera.enabled = false;
                        _badCameraDisabled = true;
                    }
                }
            }

            if (Input.GetKeyDown(_cfgSwapButton.Value))
            {
                Mode = (RenderMode) (((int) Mode + 1) % 3);
            }

            // Update framebuffers if game resolution changed.
            if (_gameRes != _gameRenderTexture.Size())
            {
                Debug.Log($"Sharpener: Regenerating game render targets: {_gameRes}");
                Destroy(_gameRenderTexture);
                _gameRenderTexture = new RenderTexture(_gameRes.x, _gameRes.y, 24);

                Destroy(_upscaler);
                _upscaler = new RenderTexture(_gameRes.x * 2, _gameRes.y * 2, 0);
                _upscaler.filterMode = FilterMode.Bilinear;
            }

            // Set camera target texture if rendering to UpDown.
            _futile.camera.targetTexture = IsUpDown ? _gameRenderTexture : null;

            // Set resolution to fullscreen res if fullscreen and not using GameDefault.
            var shouldSetScreenRes = GameResBackbuffer ? _gameRes : TargetHighRes;
            var curScreenRes = new IntVector2(_trampolineWidth(), _trampolineHeight());
            if (shouldSetScreenRes != curScreenRes)
            {
                curScreenRes = shouldSetScreenRes;
                var (w, h) = shouldSetScreenRes;
                _trampolineSetResolution(w, h, Screen.fullScreen);
            }

            if (curScreenRes != _realRes)
            {
                _realRes = curScreenRes;
                Debug.Log($"Sharpener: new screen resolution: {_realRes}");
            }

            Shader.SetGlobalVector("_realRenderScreenSize",
                (Mode == RenderMode.NativeNearest ? FullscreenRes : _gameRes).ToVector2());

            UIUpdate();
        }

        private void FutileOnInit(On.Futile.orig_Init orig, Futile self, FutileParams futileParams)
        {
            orig(self, futileParams);

            _futile = self;

            _futile._cameraHolder.AddComponent<Scaler>();
        }

        private static void HookScreenSetResolution(int width, int height, bool fullscreen)
        {
            Instance._gameRes = new IntVector2(width, height);
        }

        private static int HookScreenWidth() => Instance._gameRes.x;
        private static int HookScreenHeight() => Instance._gameRes.y;

        private static Vector3 HookMousePosition()
        {
            var realPosition = _trampolineMousePosition();
            if (Instance.GameResBackbuffer)
                return realPosition;

            var gameRes = Instance._gameRes.ToVector2();
            Instance.CalcScreenRect(out var scrPos, out var scrSize);

            var posX = realPosition.x;
            var posY = realPosition.y;

            posX -= scrPos.x;
            posY -= scrPos.y;

            posX /= scrSize.x;
            posY /= scrSize.y;

            posX *= gameRes.x;
            posY *= gameRes.y;

            return new Vector3(posX, posY, 0);
        }

        private void CalcScreenRect(out Vector2 pos, out Vector2 size)
        {
            var gameSize = _gameRes.ToVector2();
            var screenSize = _realRes.ToVector2();

            var ratioX = screenSize.x / gameSize.x;
            var ratioY = screenSize.y / gameSize.y;

            var ratio = Math.Min(ratioX, ratioY);

            size = gameSize * ratio;
            pos = (screenSize - size) / 2;
        }

        private sealed class Scaler : MonoBehaviour
        {
            private void OnPreRender()
            {
                if (Instance.IsUpDown)
                    GL.LoadProjectionMatrix(GL.GetGPUProjectionMatrix(Camera.current.projectionMatrix, true));
            }

            private void OnPostRender()
            {
                RenderTexture.active = null;

                GL.PushMatrix();
                GL.LoadOrtho();

                if (Instance.IsUpDown)
                {
                    Instance._gameRenderTexture.filterMode = FilterMode.Point;
                    RenderTexture.active = Instance._upscaler;

                    // Alpha channel to 1
                    GL.Clear(true, true, Color.black);

                    Graphics.DrawTexture(
                        new Rect(0, 0, 1, 1),
                        Instance._gameRenderTexture,
                        new Rect(0, 0, 1, 1),
                        0, 0, 0, 0,
                        Instance._blitShader);

                    RenderTexture.active = null;

                    GL.LoadOrtho();
                    GL.Viewport(new Rect(0, 0, Instance._realRes.x, Instance._realRes.y));
                    GL.LoadPixelMatrix(0, Instance._realRes.x, 0, Instance._realRes.y);
                    GL.Clear(true, true, Color.clear);

                    Instance.CalcScreenRect(out var posScreen, out var sizeScreen);

                    Graphics.DrawTexture(
                        new Rect(posScreen.x, posScreen.y, sizeScreen.x, sizeScreen.y),
                        Instance._upscaler,
                        new Rect(0, 1, 1, -1),
                        0, 0, 0, 0,
                        Instance._blitShader);
                }

                GL.PopMatrix();
            }
        }

        private static void MakeNativeHook<TDelegate>(
            string from,
            string to,
            Type[] paramTypes,
            out TDelegate trampoline,
            out NativeDetour detour)
            where TDelegate : Delegate
        {
            var fromMethod = typeof(Input).GetMethod(@from, paramTypes);

            MakeNativeHook(fromMethod, to, out trampoline, out detour);
        }

        private static void MakeNativeHook<TDelegate>(
            MethodBase fromMethod,
            string to,
            out TDelegate trampoline,
            out NativeDetour detour)
            where TDelegate : Delegate
        {
            var toMethod = typeof(SharpenerMod).GetMethod(to, BindingFlags.NonPublic | BindingFlags.Static);

            detour = new NativeDetour(fromMethod, toMethod);
            trampoline = detour.GenerateTrampoline<TDelegate>();
        }

        private static string ModeToName(RenderMode mode)
        {
            return mode switch
            {
                RenderMode.GameDefault => "Blurry (game default)",
                RenderMode.UpDown => "Sharper",
                RenderMode.NativeNearest => "Native resolution",
                _ => throw new ArgumentOutOfRangeException(nameof(mode), mode, null)
            };
        }

        private enum RenderMode
        {
            [Description("Blurry (game default)")] GameDefault = 0,
            [Description("Sharper")] UpDown = 1,

            // ReSharper disable once UnusedMember.Local
            [Description("Native resolution")] NativeNearest = 2,
        }
    }
}
