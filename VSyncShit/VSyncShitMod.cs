using BepInEx;
using Menu;
using UnityEngine;
using PauseMenu = On.Menu.PauseMenu;

namespace VSyncShit
{
    [BepInPlugin("pjb3005.vsyncshit", "VSyncShit", "0.1.0")]
    public sealed class VSyncShitMod : BaseUnityPlugin
    {
        public VSyncShitMod()
        {
            On.Menu.PauseMenu.ctor += PauseMenuOnctor;
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
                return QualitySettings.vSyncCount != 0;
            }

            public void SetChecked(CheckBox box, bool c)
            {
                QualitySettings.vSyncCount = c ? 1 : 0;
            }
        }
    }
}
