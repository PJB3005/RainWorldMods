using System;
using System.Globalization;
using System.Reflection;
using BepInEx;
using Menu.Remix.MixedUI;
using MonoMod.RuntimeDetour;
using RWCustom;
using UnityEngine;
using UnityEngine.UI;

namespace Sharpener;

[BepInPlugin(ModID, "Sharpener", "0.1.0")]
public sealed class SharpenerMod : BaseUnityPlugin
{
    public const string ModID = "pjb3005.sharpener";

    public static SharpenerMod Instance { get; private set; } = default!;

    private Scaler _cameraScaler = default!;
    private RectTransform? _cameraImageTransform;
    private readonly SharpenerOptions _options;

    // Hooks for making the game believe it's always running at original resolutions.
    // @formatter:off
    private readonly SetResolution _trampolineSetResolution;
    private readonly NativeDetour  _detourSetResolution;
    private readonly NativeDetour  _detourWidth;
    private readonly Func<int>     _trampolineWidth;
    private readonly NativeDetour  _detourHeight;
    private readonly Func<int>     _trampolineHeight;
    private readonly NativeDetour  _detourMousePosition;
    private readonly Func<Vector3> _trampolineMousePosition;
    // @formatter:on

    // Resolution the game wants/expects.
    private IntVector2 _gameRes = new(600, 400);

    // Real resolution of the game.
    private IntVector2 _realRes;

    // Temporary render target we use for scaling purposes.
    private RenderTexture? _scalerTexture;

    private bool _initialized;

    private IntVector2 _fullscreenRes;

    public SharpenerMod()
    {
        try
        {
            Instance = this;

            _options = new SharpenerOptions(this, Logger);
            BindCfgChanged(_options.fullscreenResolution, CfgFullscreenResChanged);

            On.RainWorld.OnModsInit += RainWorldOnOnModsInit;
            On.Futile.UpdateScreenWidth += FutileOnUpdateScreenWidth;
            On.ScreenSafeArea.Update += ScreenSafeAreaOnUpdate;

            // Screen.SetResolution()
            _detourSetResolution = new NativeDetour(
                (SetResolution)Screen.SetResolution,
                (SetResolution)HookScreenSetResolution);

            _trampolineSetResolution = _detourSetResolution.GenerateTrampoline<SetResolution>();

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

    private void CfgFullscreenResChanged(string newRes)
    {
        var split = newRes.Split('x');
        var w = int.Parse(split[0], CultureInfo.InvariantCulture);
        var h = int.Parse(split[1], CultureInfo.InvariantCulture);

        _fullscreenRes = new IntVector2(w, h);
        Logger.LogDebug($"cfg fullscreen res changed to: {_fullscreenRes}");
    }

    private static void ScreenSafeAreaOnUpdate(On.ScreenSafeArea.orig_Update orig, ScreenSafeArea self)
    {
        // Trust issues with this code, seems console specific so turning it off entirely.
    }

    private void RainWorldOnOnModsInit(On.RainWorld.orig_OnModsInit orig, RainWorld self)
    {
        orig(self);

        Logger.LogDebug("Mod init");

        try
        {
            MachineConnector.SetRegisteredOI(ModID, _options);

            var futile = Futile.instance;
            _cameraScaler = futile.camera.gameObject.AddComponent<Scaler>();
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
        if (_scalerTexture is not null)
        {
            _scalerTexture.DiscardContents();
            _scalerTexture.Release();
        }

        var (w, h) = CalcScalerSize();

        Logger.LogDebug($"Regenerating scaler render target: {w}x{h}");

        _scalerTexture = new RenderTexture(w, h, src.depth, src.format);
        _scalerTexture.filterMode = FilterMode.Bilinear;
        _cameraScaler.SourceTexture = src;
        _cameraScaler.DestTexture = _scalerTexture;

        Futile.instance._cameraImage.texture = _cameraScaler.DestTexture;
    }

    private IntVector2 CalcScalerSize()
    {
        var gameRes = Futile.screen.renderTexture.Size();
        var upscaleFactorX = Math.Ceiling(_realRes.x / (float)gameRes.x);
        var upscaleFactorY = Math.Ceiling(_realRes.y / (float)gameRes.y);

        var scaleFactor = Math.Max((int)Math.Max(upscaleFactorX, upscaleFactorY), 1);
        return gameRes * scaleFactor;
    }

    private void Update()
    {
        if (!_initialized)
            return;

        try
        {
            var shouldSetScreenRes = GetDesiredScreenRes();
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
                Logger.LogDebug($"new screen resolution: {_realRes}");
            }

            var upscaleRes = CalcScalerSize();

            if (_scalerTexture is null || upscaleRes != _scalerTexture.Size())
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
        Instance.Logger.LogDebug($"Game changing resolution to: {width}x{height} FS: {fullscreen}");
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
