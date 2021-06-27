using System;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.InteropServices;
using BepInEx;
using MonoMod.RuntimeDetour;
using RWCustom;
using UnityEngine;

namespace Sharpener
{
    [BepInPlugin("pjb3005.sharpener", "Sharpener", "0.1.0")]
    public class SharpenerMod : BaseUnityPlugin
    {
        private delegate void SetResolution(int width, int height, bool fullscreen);

        private static SharpenerMod _instance;

        private static SetResolution _trampolineSetResolution;
        private static NativeDetour _detourSetResolution;
        private static NativeDetour _detourWidth;
        private static Func<int> _trampolineWidth;
        private static NativeDetour _detourHeight;
        private static Func<int> _trampolineHeight;
        private static NativeDetour _detourMousePosition;
        private static Func<Vector3> _trampolineMousePosition;
        private static NativeDetour _detourFullscreenSet;
        private static Action<bool> _trampolineFullscreenSet;

        private RenderTexture _gameRenderTexture;
        private Futile _futile;

        private IntVector2 _gameRes = new IntVector2(600, 400);
        private IntVector2 _realRes;
        private IntVector2 _fullscreenRes;

        private RenderTexture _upscaler;

        private bool _badCameraDisabled;

        private RenderMode _mode = RenderMode.UpDown;
        private bool _lastKeyDown;

        private bool HighResBackbuffer => !Screen.fullScreen || _mode == RenderMode.GameDefault;
        private bool IsUpDown => Screen.fullScreen && _mode == RenderMode.UpDown;

        private Material _blitShader;

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

        public SharpenerMod()
        {
            try
            {
                _blitShader = new Material(BlitShaderSource);

                _fullscreenRes = Screen.resolutions
                    .OrderBy(r => r.width)
                    .ThenBy(r => r.height)
                    .Last()
                    .ToVec();

                _instance = this;

                _upscaler = new RenderTexture(1, 1, 0);
                _upscaler.filterMode = FilterMode.Bilinear;

                On.Futile.Init += FutileOnInit;

                _detourSetResolution = new NativeDetour(
                    (SetResolution) Screen.SetResolution,
                    (SetResolution) HookScreenSetResolution);

                _trampolineSetResolution = _detourSetResolution.GenerateTrampoline<SetResolution>();

                _gameRenderTexture = new RenderTexture(1, 1, 24);

                // ReSharper disable once PossibleNullReferenceException
                var getWidth = typeof(Screen).GetProperty(nameof(Screen.width)).GetGetMethod();
                MakeNativeHook(
                    getWidth,
                    nameof(HookScreenWidth),
                    out _trampolineWidth,
                    out _detourWidth);

                // ReSharper disable once PossibleNullReferenceException
                var getHeight = typeof(Screen).GetProperty(nameof(Screen.height)).GetGetMethod();
                MakeNativeHook(
                    getHeight,
                    nameof(HookScreenHeight),
                    out _trampolineHeight,
                    out _detourHeight);

                // ReSharper disable once PossibleNullReferenceException
                var setFullscreen = typeof(Screen).GetProperty(nameof(Screen.fullScreen)).GetSetMethod();
                MakeNativeHook(
                    setFullscreen,
                    nameof(HookSetFullscreen),
                    out _trampolineFullscreenSet,
                    out _detourFullscreenSet);

                // ReSharper disable once PossibleNullReferenceException
                var getMousePosition = typeof(Input).GetProperty(nameof(Input.mousePosition)).GetGetMethod();
                MakeNativeHook(
                    getMousePosition,
                    nameof(HookMousePosition),
                    out _trampolineMousePosition,
                    out _detourMousePosition);
            }
            catch (Exception e)
            {
                MessageBoxW(IntPtr.Zero, e.ToString(), "Fuck", 0);
            }
        }

        private bool Fuck = false;

        public void Update()
        {
            // Rain World has an extra camera in the bottom left corner.
            // It doesn't do anything except break rendering when going off-screen and waste CPU/GPU.
            // So we disable it as soon as we can.
            if (!_badCameraDisabled)
            {
                foreach (var camera in Camera.allCameras)
                {
                    Debug.Log($"CAMERA: {camera.name}, {camera.tag}, {camera.targetTexture}");

                    if (!camera.CompareTag("MainCamera"))
                    {
                        Debug.Log("Disabling bad camera");
                        camera.enabled = false;
                        _badCameraDisabled = true;
                    }
                }
            }

            if (Input.GetKey(KeyCode.F10) && !_lastKeyDown)
            {
                _lastKeyDown = true;
                _mode = (RenderMode) (((int) _mode + 1) % 3);
            }

            if (!Input.GetKey(KeyCode.F10))
                _lastKeyDown = false;

            // Update framebuffers if game resolution changed.
            if (_gameRes != _gameRenderTexture.Size())
            {
                Debug.Log($"Regenerating game render targets: {_gameRes}");
                Destroy(_gameRenderTexture);
                _gameRenderTexture = new RenderTexture(_gameRes.x, _gameRes.y, 24);

                Destroy(_upscaler);
                _upscaler = new RenderTexture(_gameRes.x * 2, _gameRes.y * 2, 0);
                _upscaler.filterMode = FilterMode.Bilinear;
            }

            // Set camera target texture if rendering to UpDown.
            _futile.camera.targetTexture = IsUpDown ? _gameRenderTexture : null;

            // Set resolution to fullscreen res if fullscreen and not using GameDefault.
            var shouldSetScreenRes = HighResBackbuffer ? _gameRes : _fullscreenRes;
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
                Debug.Log($"NEW SCREEN RESOLUTION: {_realRes}");
            }
        }

        private void FutileOnInit(On.Futile.orig_Init orig, Futile self, FutileParams futileParams)
        {
            orig(self, futileParams);

            _futile = self;

            _futile._cameraHolder.AddComponent<Scaler>();
        }

        private static void HookScreenSetResolution(int width, int height, bool fullscreen)
        {
            _instance._gameRes = new IntVector2(width, height);
        }

        private static int HookScreenWidth() => _instance._gameRes.x;
        private static int HookScreenHeight() => _instance._gameRes.y;

        private static Vector3 HookMousePosition()
        {
            var realPosition = _trampolineMousePosition();
            if (_instance.HighResBackbuffer)
                return realPosition;

            var realRes = _instance._realRes.ToVector2();
            var gameRes = _instance._gameRes.ToVector2();
            var scale = gameRes.x / realRes.x;

            var scaled = realPosition * scale;

            /*
            Debug.Log($"REAL: {realPosition}");
            Debug.Log($"SCALED: {scaled}");
            Debug.Log($"SCALE: {scale}");
            */

            return scaled;
        }

        private static void HookSetFullscreen(bool value)
        {
            if (value == Screen.fullScreen)
                return;

            _trampolineFullscreenSet(value);

            if (value)
            {
                var (w, h) = _instance._fullscreenRes;
                _trampolineSetResolution(w, h, true);
            }
        }

        [DllImport("user32.dll")]
        private static extern int MessageBoxW(
            IntPtr hWnd,
            [MarshalAs(UnmanagedType.LPWStr)] string lpText,
            [MarshalAs(UnmanagedType.LPWStr)] string lpCaption,
            uint uType);

        private sealed class Scaler : MonoBehaviour
        {
            private void OnPreRender()
            {
                if (_instance.IsUpDown)
                    GL.LoadProjectionMatrix(GL.GetGPUProjectionMatrix(Camera.current.projectionMatrix, true));
            }

            private void OnPostRender()
            {
                RenderTexture.active = null;

                GL.PushMatrix();
                GL.LoadOrtho();

                if (_instance.IsUpDown)
                {
                    _instance._gameRenderTexture.filterMode = FilterMode.Point;
                    RenderTexture.active = _instance._upscaler;

                    // Alpha channel to 1
                    GL.Clear(true, true, Color.black);

                    Graphics.DrawTexture(
                        new Rect(0, 0, 1, 1),
                        _instance._gameRenderTexture,
                        new Rect(0, 0, 1, 1),
                        0, 0, 0, 0,
                        _instance._blitShader);

                    RenderTexture.active = null;

                    GL.LoadOrtho();
                    GL.Viewport(new Rect(0, 0, _instance._realRes.x, _instance._realRes.y));
                    GL.Clear(true, true, Color.clear);

                    Graphics.DrawTexture(
                        new Rect(0, 1, 1, -1),
                        _instance._upscaler,
                        new Rect(0, 0, 1, 1),
                        0, 0, 0, 0,
                        _instance._blitShader);
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

        private enum RenderMode
        {
            GameDefault = 0,
            UpDown = 1,
            NativeNearest = 2,
        }
    }
}
