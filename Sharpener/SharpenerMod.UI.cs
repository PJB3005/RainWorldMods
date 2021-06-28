using System;
using UnityEngine;

namespace Sharpener
{
    public partial class SharpenerMod
    {
        private FLabel _modeLabel;
        private float _modeShowTime = float.NegativeInfinity;

        public void InitUI()
        {
        }

        private void UIUpdate()
        {
            if (Time.time - _modeShowTime > 1)
            {
                DestroyModeShow();
            }
        }

        private void UIShowModeSwitch()
        {
            DestroyModeShow();

            _modeLabel = new FLabel("font", ModeToName(_mode));
            _modeLabel.alignment = FLabelAlignment.Left;
            _modeLabel.x = 10;
            _modeLabel.y = 768 - 13;
            Futile.stage.AddChild(_modeLabel);

            _modeShowTime = Time.time;
        }

        private void DestroyModeShow()
        {
            _modeLabel?.RemoveFromContainer();
            _modeLabel = null;
        }

        private static string ModeToName(RenderMode mode)
        {
            return mode switch
            {
                RenderMode.GameDefault => "Blurry (base game)",
                RenderMode.UpDown => "Sharper",
                RenderMode.NativeNearest => "Native resolution",
                _ => throw new ArgumentOutOfRangeException(nameof(mode), mode, null)
            };
        }
    }
}
