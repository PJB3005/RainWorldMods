using System;
using System.Linq;
using BepInEx.Configuration;
using RWCustom;
using UnityEngine;

namespace Sharpener
{
    public partial class SharpenerMod
    {
        private ConfigEntry<RenderMode> _cfgMode;
        private ConfigEntry<KeyCode> _cfgSwapButton;
        private ConfigEntry<bool> _cfgOverrideWindow;
        private ConfigEntry<int> _cfgOverrideWindowWidth;
        private ConfigEntry<int> _cfgOverrideWindowHeight;
        private ConfigEntry<ResolutionCfg> _cfgFullScreenRes;

        private IntVector2 WindowOverrideSize => IntVector2.RectClamp(
            new IntVector2(_cfgOverrideWindowWidth.Value, _cfgOverrideWindowHeight.Value), 800, 600, 16384, 16384);

        private void InitConfig()
        {
            TomlTypeConverter.AddConverter(typeof(ResolutionCfg), new TypeConverter
            {
                ConvertToObject = ConvertResolutionToObject,
                ConvertToString = ConvertResolutionToString
            });

            Config.SaveOnConfigSet = true;

            _cfgMode = Config.Bind(
                "Scaling", "Render Mode",
                RenderMode.UpDown,
                "Controls how Sharpener will render and/or scale the game.");

            _cfgSwapButton = Config.Bind(
                "Scaling", "Mode Switch Hotkey",
                KeyCode.F10,
                "Hotkey to cycle through available render modes at any time.");

            _cfgOverrideWindow = Config.Bind(
                "Window", "Enable Override",
                false,
                "Enable window size overriding. Does not work for default render mode mode.");

            _cfgOverrideWindowWidth = Config.Bind(
                "Window", "Override Window Width",
                1366,
                new ConfigDescription("Override window width", new AcceptableValueRange<int>(800, int.MaxValue)));

            _cfgOverrideWindowHeight = Config.Bind(
                "Window", "Override Window Height",
                768,
                new ConfigDescription("Override window height", new AcceptableValueRange<int>(600, int.MaxValue)));

            var resolutions = Screen.resolutions.Select(r => new ResolutionCfg(r.width, r.height)).Distinct().ToArray();

            _cfgFullScreenRes = Config.Bind(
                "Fullscreen", "Fullscreen Resolution",
                _defaultFullscreenRes,
                new ConfigDescription("The resolution the game will use when in fullscreen",
                    new AcceptableValueList<ResolutionCfg>(resolutions)));

            _cfgMode.SettingChanged += OnCfgModeChanged;
        }

        private void OnCfgModeChanged(object sender, EventArgs e)
        {
            Debug.Log($"Sharpener: Mode changed to {_cfgMode.Value}");

            UIShowModeSwitch();
        }

        private static string ConvertResolutionToString(object resolution, Type type)
        {
            if (type != typeof(ResolutionCfg))
                throw new ArgumentException();

            var res = (ResolutionCfg) resolution;
            return $"{res.Resolution.x}x{res.Resolution.y}";
        }

        private static object ConvertResolutionToObject(string value, Type type)
        {
            if (type != typeof(ResolutionCfg))
                throw new ArgumentException();

            var split = value.Split('x');
            var x = int.Parse(split[0]);
            var y = int.Parse(split[1]);
            return new ResolutionCfg(x, y);
        }


        private sealed class ResolutionCfg : IEquatable<ResolutionCfg>
        {
            public readonly IntVector2 Resolution;

            public ResolutionCfg(int x, int y) : this(new IntVector2(x, y))
            {
            }

            public ResolutionCfg(IntVector2 resolution)
            {
                Resolution = resolution;
            }

            public override string ToString()
            {
                return $"{Resolution.x}x{Resolution.y}";
            }

            public bool Equals(ResolutionCfg other)
            {
                if (ReferenceEquals(null, other)) return false;
                if (ReferenceEquals(this, other)) return true;

                return Resolution.x == other.Resolution.x && Resolution.y == other.Resolution.y;
            }

            public override bool Equals(object obj)
            {
                return ReferenceEquals(this, obj) || obj is ResolutionCfg other && Equals(other);
            }

            public override int GetHashCode()
            {
                return Resolution.x ^ (Resolution.y * 397);
            }

            public static bool operator ==(ResolutionCfg left, ResolutionCfg right)
            {
                return Equals(left, right);
            }

            public static bool operator !=(ResolutionCfg left, ResolutionCfg right)
            {
                return !Equals(left, right);
            }
        }
    }
}
