using System;
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

        public const int LayerFutile = 1;
        public const int LayerReScale = 2;

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

        private RenderTexture _upscaler;
        private Resolution _fullscreenRes;

        private bool _badCameraDisabled;

        public SharpenerMod()
        {
            try
            {
                _fullscreenRes = Screen.resolutions.OrderBy(r => r.width).ThenBy(r => r.height).Last();

                _instance = this;

                _upscaler = new RenderTexture(1366 * 2, 768 * 2, 0);
                _upscaler.filterMode = FilterMode.Bilinear;

                On.Futile.Init += FutileOnInit;
                On.FStage.ctor += FStageOnCtor;
                // On.Menu.MainMenu.ctor += MainMenuOnCtor;

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

        /*
        private void MainMenuOnCtor(MainMenu.orig_ctor orig, Menu.MainMenu self, ProcessManager manager,
            bool showRegionSpecificBkg)
        {
            orig(self, manager, showRegionSpecificBkg);

            foreach (var camera in Camera.allCameras)
            {
                Debug.Log($"{camera.name}, {camera.tag}, {camera.targetTexture}");

                if (!camera.CompareTag("MainCamera"))
                {
                    camera.backgroundColor = Color.yellow;
                    camera.enabled = false;
                }
            }
        }*/

        public void Update()
        {
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

            var newScreenRes = new IntVector2(_trampolineWidth(), _trampolineHeight());
            if (newScreenRes != _realRes)
            {
                _realRes = newScreenRes;
                Debug.Log($"NEW SCREEN RESOLUTION: {_realRes}");
            }

            if (_gameRes != new IntVector2(_gameRenderTexture.width, _gameRenderTexture.height))
            {
                Debug.Log($"{_gameRes.x}, {_gameRes.y}");
                Destroy(_gameRenderTexture);
                _gameRenderTexture = new RenderTexture(_gameRes.x, _gameRes.y, 24);
                _futile.camera.targetTexture = _gameRenderTexture;

                Destroy(_upscaler);
                _upscaler = new RenderTexture(_gameRes.x * 2, _gameRes.y * 2, 0);
                _upscaler.filterMode = FilterMode.Bilinear;
            }
        }

        private static void FStageOnCtor(On.FStage.orig_ctor orig, FStage self, string s)
        {
            orig(self, s);

            self.layer = LayerFutile;
        }

        private void FutileOnInit(On.Futile.orig_Init orig, Futile self, FutileParams futileParams)
        {
            orig(self, futileParams);

            _futile = self;

            self.camera.cullingMask = 1 << LayerFutile;
            //self.camera.backgroundColor = Color.red;
            _futile._cameraHolder.AddComponent<Scaler>();
            self.camera.depth = -100;
        }

        private static void HookScreenSetResolution(int width, int height, bool fullscreen)
        {
            Debug.Log($"SET RES: {width}, {height}");

            try
            {
                _instance._gameRes = new IntVector2(width, height);
            }
            catch (Exception e)
            {
                MessageBoxW(IntPtr.Zero, e.ToString(), "Fuck", 0);
            }
        }

        private static int HookScreenWidth()
        {
            return _instance._gameRes.x;
        }

        private static int HookScreenHeight()
        {
            return _instance._gameRes.y;
        }

        private static Vector3 HookMousePosition()
        {
            var realPosition = _trampolineMousePosition();
            var realRes = new Vector2(_instance._realRes.x, _instance._realRes.y);
            var gameRes = new Vector2(_instance._gameRes.x, _instance._gameRes.y);
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
                _trampolineSetResolution(_instance._fullscreenRes.width, _instance._fullscreenRes.height, true);
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
            private bool _enabled = true;
            private bool _lastKeyDown;

            private void Update()
            {
                if (Input.GetKey(KeyCode.F10) && !_lastKeyDown)
                {
                    _lastKeyDown = true;
                    _enabled ^= true;
                }

                if (!Input.GetKey(KeyCode.F10))
                    _lastKeyDown = false;
            }

            private void OnPreRender()
            {
                GL.LoadProjectionMatrix(GL.GetGPUProjectionMatrix(Camera.current.projectionMatrix, true));
            }

            private void OnPostRender()
            {
                RenderTexture.active = null;

                GL.PushMatrix();
                GL.LoadOrtho();

                if (_enabled)
                {
                    _instance._gameRenderTexture.filterMode = FilterMode.Point;
                    Graphics.SetRenderTarget(_instance._upscaler);
                    Graphics.DrawTexture(new Rect(0, 0, 1, 1), _instance._gameRenderTexture, new Rect(0, 0, 1, 1), 0, 0,
                        0, 0);
                    RenderTexture.active = null;
                    GL.LoadOrtho();
                    GL.Viewport(new Rect(0, 0, _instance._realRes.x, _instance._realRes.y));
                    Graphics.DrawTexture(new Rect(0, 0, 1, 1), Texture2D.whiteTexture, new Rect(0, 0, 1, 1), 0, 0, 0, 0,
                        Color.black);
                    Graphics.DrawTexture(new Rect(0, 1, 1, -1), _instance._upscaler, new Rect(0, 0, 1, 1), 0, 0, 0, 0);
                }
                else
                {
                    _instance._gameRenderTexture.filterMode = FilterMode.Bilinear;
                    Graphics.SetRenderTarget(null);
                    GL.LoadOrtho();
                    GL.Viewport(new Rect(0, 0, _instance._realRes.x, _instance._realRes.y));
                    Graphics.DrawTexture(new Rect(0, 0, 1, 1), Texture2D.whiteTexture, new Rect(0, 0, 1, 1), 0, 0, 0, 0,
                        Color.black);

                    Graphics.DrawTexture(new Rect(0, 0, 1, 1), _instance._gameRenderTexture, new Rect(0, 0, 1, 1), 0, 0,
                        0, 0);
                }

                /*
                Graphics.DrawTexture(
                    new Rect(0.0f, 0.0f, 1f, 1f),
                    _instance._gameRenderTexture,
                    new Rect(0, 0, 1, 1),
                    0, 0, 0, 0);
                    */

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
            GameDefault,
            NativeNearest,
            UpDown
        }
    }
}
