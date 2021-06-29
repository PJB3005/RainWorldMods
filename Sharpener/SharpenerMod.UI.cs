using System;
using BepInEx.Configuration;
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

            _modeLabel = new FLabel("font", ModeToName(Mode));
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
    }
}
