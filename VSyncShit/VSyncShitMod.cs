using System;
using BepInEx;
using BepInEx.Configuration;
using Menu;
using UnityEngine;
using PauseMenu = On.Menu.PauseMenu;

namespace VSyncShit
{
    [BepInPlugin("pjb3005.vsyncshit", "VSyncShit", "0.1.0")]
    public sealed class VSyncShitMod : BaseUnityPlugin
    {
        private static ConfigEntry<bool> _cfgVSync;

        public VSyncShitMod()
        {
            Config.SaveOnConfigSet = true;
            _cfgVSync = Config.Bind("VSync", "Enabled", false);
            _cfgVSync.SettingChanged += CfgVSyncOnSettingChanged;

            On.Menu.PauseMenu.ctor += PauseMenuOnctor;

            CfgVSyncOnSettingChanged(null, null);
        }

        private static void CfgVSyncOnSettingChanged(object sender, EventArgs e)
        {
            Debug.Log($"VSync: {_cfgVSync.Value}");

            QualitySettings.vSyncCount = _cfgVSync.Value ? 1 : 0;
        }

        private void PauseMenuOnctor(PauseMenu.orig_ctor orig, Menu.PauseMenu self, ProcessManager manager,
            RainWorldGame game)
        {
            orig(self, manager, game);

            var checkBox = new CheckBox(
                self,
                self.pages[0],
                new VSyncCheckBoxOwner(),
                new Vector2(100, 0),
                100,
                "VSync",
                "VSYNC");

            self.pages[0].subObjects.Add(checkBox);
        }

        private sealed class VSyncCheckBoxOwner : CheckBox.IOwnCheckBox
        {
            public bool GetChecked(CheckBox box)
            {
                return _cfgVSync.Value;
            }

            public void SetChecked(CheckBox box, bool c)
            {
                _cfgVSync.Value = c;
            }
        }
    }
}
