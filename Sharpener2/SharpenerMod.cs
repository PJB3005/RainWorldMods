using System;
using System.Diagnostics.CodeAnalysis;
using System.Globalization;
using System.Reflection;
using BepInEx;
using Menu;
using Menu.Remix.MixedUI;
using MonoMod.RuntimeDetour;
using RWCustom;
using UnityEngine;
using UnityEngine.UI;

namespace Sharpener;

[BepInPlugin(ModID, "Sharpener", "1.5.0")]
public sealed class SharpenerMod : BaseUnityPlugin
{
    // See this thread for ranting about Unity resolution management:
    // https://mastodon.gamedev.place/@PJB/109729660950046933

    public const string ModID = "pjb3005.sharpener";

    public static SharpenerMod Instance { get; private set; } = default!;

    private Scaler _cameraScaler = default!;
    private RectTransform? _cameraImageTransform;
    private SharpenerOptions _options = default!;

    // Hooks for making the game believe it's always running at original resolutions.
    // @formatter:off
    private SetResolution _trampolineSetResolution = default!;
    private NativeDetour  _detourSetResolution = default!;
    private NativeDetour  _detourWidth = default!;
    private Func<int>     _trampolineWidth = default!;
    private NativeDetour  _detourHeight = default!;
    private Func<int>     _trampolineHeight = default!;
    private NativeDetour  _detourMousePosition = default!;
    private Func<Vector3> _trampolineMousePosition = default!;
    // @formatter:on

    // Resolution the game wants/expects.
    private IntVector2 _gameRes;

    // Real resolution of the game.
    private IntVector2 _realRes;

    // Temporary render target we use for scaling purposes.
    private RenderTexture? _scalerTexture;

    private bool _initialized;

    private IntVector2 _fullscreenRes;

    // The size we last passed to Screen.setResolution()
    private IntVector2 _lastSetScreenRes;

    private void Awake()
    {
        try
        {
            Instance = this;

            _options = new SharpenerOptions(this, Logger);
            BindCfgChanged(_options.fullscreenResolution, CfgFullscreenResChanged);

            On.RainWorld.OnModsInit += RainWorldOnOnModsInit;
            On.Futile.UpdateScreenWidth += FutileOnUpdateScreenWidth;
            On.ScreenSafeArea.Update += ScreenSafeAreaOnUpdate;
            On.Menu.OptionsMenu.ctor += OptionsMenuCtor;

            // Screen.SetResolution()
            _detourSetResolution = new NativeDetour(
                (SetResolution)Screen.SetResolution,
                (SetResolution)HookScreenSetResolution);

            _trampolineSetResolution = _detourSetResolution.GenerateTrampoline<SetResolution>();

            // Set both resolution variables to the current resolution Unity picked at startup.
            // The game will change _gameRes to what it wants, and we'll track that.
            // Sharpener will change the real res to match settings in Update once initialized.
            _realRes = _gameRes = new IntVector2(Screen.width, Screen.height);
            Logger.LogInfo($"Initial game resolution: {_realRes}");

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
        }
        catch (Exception e)
        {
            Logger.LogError($"Failed to initialize: {e}");
            throw;
        }
    }

    private void OptionsMenuCtor(On.Menu.OptionsMenu.orig_ctor orig, Menu.OptionsMenu self, ProcessManager manager)
    {
        orig(self, manager);

        var pos = new Vector2(350f, 500f);
        var size = new Vector2(self.saveSlotButtons[0].pos.x - pos.x, 60f);

        self.pages[0].subObjects.Add(
            new MenuLabel(
                self,
                self.pages[0],
                $"Sharpener loaded,\nset native resolution\nvia Remix mod settings\ncurrent: {_realRes.x}x{_realRes.y}",
                pos,
                size,
                false));
    }

    private void CfgFullscreenResChanged(string newRes)
    {
        var split = newRes.Split('x');
        var w = int.Parse(split[0], CultureInfo.InvariantCulture);
        var h = int.Parse(split[1], CultureInfo.InvariantCulture);

        _fullscreenRes = new IntVector2(w, h);
        Logger.LogInfo($"cfg fullscreen res changed to: {_fullscreenRes}");
    }

    private static void ScreenSafeAreaOnUpdate(On.ScreenSafeArea.orig_Update orig, ScreenSafeArea self)
    {
        // Trust issues with this code, seems console specific so turning it off entirely.
    }

    private void RainWorldOnOnModsInit(On.RainWorld.orig_OnModsInit orig, RainWorld self)
    {
        orig(self);

        try
        {
            MachineConnector.SetRegisteredOI(ModID, _options);

            var futile = Futile.instance;
            _cameraScaler = futile.camera.gameObject.AddComponent<Scaler>();
            // Set first camera depth so it renders after the split-screen camera.
            // Doing this pre-emptively to probably avoid breaking Futile's split-screen support.
            futile.camera.depth = 105;
            // Take control of the camera image to do letterboxing ourselves.
            _cameraImageTransform = futile._cameraImage.GetComponent<RectTransform>();
            _cameraImageTransform.anchorMax = Vector2.zero;
            futile._cameraImage.GetComponentInParent<CanvasScaler>().enabled = false;

            _initialized = true;
        }
        catch (Exception e)
        {
            Logger.LogError($"Sharpener mod init failed: {e}");
        }
    }

    private void FutileOnUpdateScreenWidth(On.Futile.orig_UpdateScreenWidth orig, Futile self, int newWidth)
    {
        orig(self, newWidth);

        if (!_initialized)
            return;

        UpdateScaleBuffer();
    }

    private void UpdateScaleBuffer()
    {
        var src = Futile.screen.renderTexture;
        DestroyScaleBufferCore();

        var (w, h) = CalcScalerSize(out _, true);

        Logger.LogInfo($"Regenerating scaler render target: {w}x{h}");

        _scalerTexture = new RenderTexture(w, h, src.depth, src.format);
        _scalerTexture.filterMode = FilterMode.Bilinear;
        _cameraScaler.SourceTexture = src;
        _cameraScaler.DestTexture = _scalerTexture;

        Futile.instance._cameraImage.texture = _cameraScaler.DestTexture;
    }

    private void DestroyScaleBuffer()
    {
        Logger.LogInfo("Destroying scaler render target");

        DestroyScaleBufferCore();

        _cameraScaler.DestTexture = null;
        Futile.instance._cameraImage.texture = Futile.screen.renderTexture;
    }

    private void DestroyScaleBufferCore()
    {
        if (_scalerTexture is not null)
        {
            _scalerTexture.DiscardContents();
            _scalerTexture.Release();
            _scalerTexture = null;
        }
    }

    private IntVector2 CalcScalerSize(out int scaleFactor, bool log = false)
    {
        var gameRes = Futile.screen.renderTexture.Size();
        var upscaleFactorX = Math.Ceiling(_realRes.x / (float)gameRes.x);
        var upscaleFactorY = Math.Ceiling(_realRes.y / (float)gameRes.y);

        scaleFactor = Math.Max((int)Math.Min(upscaleFactorX, upscaleFactorY), 1);

        if (log)
            Logger.LogDebug($"CalcScalerSize debug: gameRes: ({gameRes}), upscaleFactorX: {upscaleFactorX}, upscaleFactorY: {upscaleFactorY}, scaleFactor: {scaleFactor}");

        return gameRes * scaleFactor;
    }

    private void Update()
    {
        try
        {
            if (Input.GetKeyDown(KeyCode.F8) && (Input.GetKey(KeyCode.LeftShift) || Input.GetKey(KeyCode.RightShift)))
                DumpLogs();

            if (!_initialized)
                return;

            var shouldSetScreenRes = GetDesiredScreenRes();
            var curScreenRes = new IntVector2(_trampolineWidth(), _trampolineHeight());
            if (shouldSetScreenRes != curScreenRes && shouldSetScreenRes != _lastSetScreenRes)
            {
                var (w, h) = shouldSetScreenRes;
                Logger.LogInfo($"setting screen resolution: {w}x{h} fs: {Screen.fullScreen}");
                _trampolineSetResolution(w, h, Screen.fullScreen);
                // Note: curScreenRes doesn't apply until next frame, assuming the setResolution call doesn't fail.
                _lastSetScreenRes = shouldSetScreenRes;
            }

            if (curScreenRes != _realRes)
            {
                _realRes = curScreenRes;
                Logger.LogInfo($"new screen resolution: {_realRes}");
            }

            var upscaleRes = CalcScalerSize(out var factor);

            if (factor == 1)
            {
                if (_scalerTexture is not null)
                {
                    // Destroy it since factor == 1, no scaling needed.
                    DestroyScaleBuffer();
                }
            }
            else if (_scalerTexture is null || upscaleRes != _scalerTexture.Size())
            {
                // If _scalerTexture is null then futile hasn't initialized yet I guess.

                UpdateScaleBuffer();
            }

            // Update Futile raw image for display and letterboxing.
            CalcScreenRect(out var rawImgPos, out var rawImgSize);
            _cameraImageTransform!.offsetMin = rawImgPos;
            _cameraImageTransform!.offsetMax = rawImgPos + rawImgSize;
        }
        catch (Exception e)
        {
            Logger.LogError(e);
        }
    }

    private IntVector2 GetDesiredScreenRes()
    {
        if (Screen.fullScreen)
            return _fullscreenRes;

        if (_options.windowSizeOverride.Value)
            return new IntVector2(_options.windowSizeWidth.Value, _options.windowSizeHeight.Value);

        return _gameRes;
    }

    private static void HookScreenSetResolution(int width, int height, bool fullscreen)
    {
        Instance.Logger.LogInfo($"Game changing resolution to: {width}x{height} FS: {fullscreen}");
        Instance._gameRes = new IntVector2(width, height);

        if (!Instance._initialized)
            Instance._trampolineSetResolution(width, height, fullscreen);
    }

    private static int HookScreenWidth()
    {
        if (!Instance._initialized)
            return Instance._trampolineWidth();

        return Instance._gameRes.x;
    }

    private static int HookScreenHeight()
    {
        if (!Instance._initialized)
            return Instance._trampolineHeight();

        return Instance._gameRes.y;
    }

    private static Vector3 HookMousePosition()
    {
        var realPosition = Instance._trampolineMousePosition();
        if (!Instance._initialized)
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

    [SuppressMessage("ReSharper", "Unity.NoNullPropagation")]
    private void DumpLogs()
    {
        Logger.LogInfo($"---- Dumping debug logs, send this to PJB ----");
        Logger.LogInfo($"Initialized: {_initialized}");
        Logger.LogInfo($"Game Res: {_gameRes}");
        Logger.LogInfo($"Real Res: {_realRes}");
        Logger.LogInfo($"Fullscreen: {Screen.fullScreen}");
        Logger.LogInfo($"Screen size (real): {_trampolineWidth()}x{_trampolineHeight()}");
        Logger.LogInfo($"Scaler: {_scalerTexture?.Size()}");
        Logger.LogInfo($"Render: {Futile.screen?.renderTexture?.Size()}");
        Logger.LogInfo($"-- camera image --");
        if (_cameraImageTransform is not null)
        {
            var image = _cameraImageTransform.GetComponent<RawImage>();
            Logger.LogInfo($"rect: {_cameraImageTransform.rect}");
            Logger.LogInfo($"anchorMin: {_cameraImageTransform.anchorMin} anchorMax: {_cameraImageTransform.anchorMax}");
            Logger.LogInfo($"offsetMin: {_cameraImageTransform.offsetMin} offsetMax: {_cameraImageTransform.offsetMax}");
            var corners = new Vector3[4];
            _cameraImageTransform.GetWorldCorners(corners);
            Logger.LogInfo($"corners: {string.Join(", ", corners)}");
            Logger.LogInfo($"uv: {image.uvRect}");
            Logger.LogInfo($"Img size: {image.mainTexture.Size()}");

            Logger.LogInfo($"-- canvas scaler --");
            var scaler = _cameraImageTransform.GetComponentInParent<CanvasScaler>();
            Logger.LogInfo($"Reference: {scaler.referenceResolution}");
            Logger.LogInfo($"Enabled: {scaler.enabled}");
        }
        else
        {
            Logger.LogInfo($"oops, it's null");
        }

        Logger.LogInfo("-- displays --");
        var displays = Display.displays;
        for (var i = 0; i < displays.Length; i++)
        {
            var display = displays[i];
            Logger.LogInfo($"- display {i} -");
            Logger.LogInfo($"active       {display.active}");
            Logger.LogInfo($"systemWidth  {display.systemWidth}");
            Logger.LogInfo($"systemHeight {display.systemHeight}");
            Logger.LogInfo($"renderWidth  {display.renderingWidth}");
            Logger.LogInfo($"renderHeight {display.renderingHeight}");
        }
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

    private static void BindCfgChanged<T>(Configurable<T> configurable, Action<T> eventHandler)
    {
        var method = configurable.GetType().GetEvent("OnChange").GetAddMethod();

        method.Invoke(configurable, new object[] { (OnEventHandler)Handler });

        // Default value!
        Handler();

        void Handler() => eventHandler(configurable.Value);
    }

    private sealed class Scaler : MonoBehaviour
    {
        // @formatter:off
        public RenderTexture? SourceTexture;
        public RenderTexture? DestTexture;
        // @formatter:on

        public void OnPostRender()
        {
            if (SourceTexture is null || DestTexture is null)
                return;

            Graphics.Blit(SourceTexture, DestTexture);
        }
    }

    private delegate void SetResolution(int width, int height, bool fullscreen);
}
