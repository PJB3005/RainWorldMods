using System.Linq;
using BepInEx.Logging;
using Menu.Remix.MixedUI;
using Menu.Remix.MixedUI.ValueTypes;
using RWCustom;
using UnityEngine;

namespace Sharpener;

public sealed class SharpenerOptions : OptionInterface
{
    private readonly SharpenerMod _mod;
    private readonly ManualLogSource _log;

    private static readonly IntVector2[] CommonResolutions =
    {
        // https://en.wikipedia.org/wiki/Display_resolution#Common_display_resolutions
        // @formatter:off
        new(640,  360),
        new(800,  600),
        new(1024, 768),
        new(1280, 720),
        new(1280, 800),
        new(1280, 1024),
        new(1360, 768),
        new(1366, 768),
        new(1440, 900),
        new(1536, 864),
        new(1600, 900),
        new(1680, 1050),
        new(1920, 1080),
        new(1920, 1200),
        new(2048, 1152),
        new(2048, 1536),
        new(2560, 1080),
        new(2560, 1440),
        new(2560, 1600),
        new(3440, 1440),
        new(3840, 2160),
        // @formatter:on
    };

    private readonly string[] _resolutions;

    public readonly Configurable<string> fullscreenResolution;
    public readonly Configurable<bool> windowSizeOverride;
    public readonly Configurable<int> windowSizeWidth;
    public readonly Configurable<int> windowSizeHeight;

    private OpCheckBox? _checkBoxWindowOverride;
    private OpTextBox? _textBoxWindowSizeWidth;
    private OpTextBox? _textBoxWindowSizeHeight;

    public SharpenerOptions(SharpenerMod mod, ManualLogSource log)
    {
        _mod = mod;
        _log = log;

        var biggest = Screen.resolutions[Screen.resolutions.Length - 1].ToVec();

        _resolutions = Screen.resolutions
            .Select(Shared.ToVec)
            .Concat(CommonResolutions)
            .Where(r => r.x <= biggest.x && r.y <= biggest.y)
            .Distinct()
            .OrderBy(x => x.x)
            .ThenBy(x => x.y)
            .Select(x => $"{x.x}x{x.y}")
            .ToArray();

        log.LogDebug(string.Join(", ", _resolutions));

        var defaultRes = _resolutions[_resolutions.Length - 1];

        // @formatter:off
        fullscreenResolution = config.Bind("fullscreenResolution", defaultRes);
        windowSizeOverride   = config.Bind("windowSizeOverride",   false);
        windowSizeWidth      = config.Bind("windowSizeWidth",      1366, new ConfigAcceptableRange<int>(640, biggest.x));
        windowSizeHeight     = config.Bind("windowSizeHeight",     768, new ConfigAcceptableRange<int>(480, biggest.y));
        // @formatter:on
    }

    public override void Initialize()
    {
        base.Initialize();

        var tab = new OpTab(this, "Options");
        Tabs = new[] { tab };

        // Fullscreen mode header

        tab.AddItems(new OpLabel(8, 600 - 20 - 8, "Fullscreen", true)
            { verticalAlignment = OpLabel.LabelVAlignment.Bottom });

        tab.AddItems(new OpLabel(
            new Vector2(150, 600 - 20 - 8 - 24 - 8),
            new Vector2(200, 24),
            "Fullscreen resolution",
            FLabelAlignment.Left));

        // Windowed mode header

        tab.AddItems(new OpLabel(8, 482, "Windowed", true)
            { verticalAlignment = OpLabel.LabelVAlignment.Bottom });

        _checkBoxWindowOverride = new OpCheckBox(windowSizeOverride, new Vector2(16, 482 - 8 - 24));
        tab.AddItems(_checkBoxWindowOverride);

        tab.AddItems(new OpLabel(
            new Vector2(16 + 24 + 8, 482 - 8 - 24),
            new Vector2(200, 24),
            "Override windowed size",
            FLabelAlignment.Left));

        _textBoxWindowSizeWidth = new OpUpdown(windowSizeWidth, new Vector2(16, 482 - 8 - 24 - 14 - 24), 100)
        {
            description = "Override window width"
        };
        tab.AddItems(_textBoxWindowSizeWidth);

        _textBoxWindowSizeHeight = new OpUpdown(
            windowSizeHeight,
            new Vector2(16 + 100 + 24, 482 - 8 - 24 - 14 - 24),
            100)
        {
            description = "Override window height"
        };
        tab.AddItems(_textBoxWindowSizeHeight);

        tab.AddItems(new OpLabel(new Vector2(16 + 100, 482 - 8 - 24 - 14 - 24), new Vector2(24, 30), "X")
            { verticalAlignment = OpLabel.LabelVAlignment.Center });

        tab.AddItems(new OpComboBox(fullscreenResolution, new Vector2(16, 600 - 20 - 8 - 24 - 8), 120, _resolutions)
        {
            description = "The resolution the game will render at to your monitor, after upscaling by Sharpener"
        });

        Update();
    }

    public override void Update()
    {
        base.Update();

        if (_checkBoxWindowOverride == null || _textBoxWindowSizeWidth == null || _textBoxWindowSizeHeight == null)
            return;

        var overrideEnabled = _checkBoxWindowOverride.GetValueBool();
        _textBoxWindowSizeWidth.greyedOut = !overrideEnabled;
        _textBoxWindowSizeHeight.greyedOut = !overrideEnabled;
    }
}
