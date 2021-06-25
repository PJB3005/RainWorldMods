using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using BepInEx;
using Menu;
using MonoMod.RuntimeDetour;
using RWCustom;
using UnityEngine;
using static InputFix.XInput;
using InputOptionsMenu = On.Menu.InputOptionsMenu;

namespace InputFix
{
    [BepInPlugin("pjb3005.input_fix", "InputFix", "0.1.0")]
    public partial class InputFix : BaseUnityPlugin
    {
        public static bool InputFixEnabled = true;

        public InputFix()
        {
            LoadSetting();
            Debug.Log($"InputFix enabled: {InputFixEnabled}.");
 
            On.Menu.InputOptionsMenu.ctor += InputOptionsMenuOnctor;
            // On.Menu.PauseMenu.ctor += PauseMenuOnctor;

            InitHooks();

            Debug.Log("InputFix hooked.");
        }

        private void InputOptionsMenuOnctor(InputOptionsMenu.orig_ctor orig, Menu.InputOptionsMenu self,
            ProcessManager manager)
        {
            orig(self, manager);

            var dark = self.inputTesterHolder.darkSprite;
            var label = new MenuLabel(self, self.pages[0],
                "Steam Input should be enabled for InputFix - See README.\nMake sure to select the XBox input preset.",
                new Vector2(450, 45), new Vector2(200, 40), false);
            label.label.alignment = FLabelAlignment.Left;
            label.label.color = Menu.Menu.MenuRGB(Menu.Menu.MenuColors.MediumGrey);
            label.label.MoveBehindOtherNode(dark);
            self.pages[0].subObjects.Insert(0, label);


            var checkBox = new CheckBox(self, self.pages[0], new InputFixEnabledOwner(), new Vector2(480, 54), 100,
                "InputFix enabled?", "INPUTFIXENABLED");
            self.pages[0].subObjects.Insert(0, checkBox);
            checkBox.label.label.MoveBehindOtherNode(dark);
            checkBox.symbolSprite.MoveBehindOtherNode(dark);
            
            self.MutualHorizontalButtonBind(self.backButton, checkBox);
            self.MutualHorizontalButtonBind(checkBox, self.testButton);
            
            foreach (var sprite in checkBox.roundedRect.sprites)
            {
                sprite.MoveBehindOtherNode(dark);
            }
        }

        /*
        private void PauseMenuOnctor(PauseMenu.orig_ctor orig, Menu.PauseMenu self, ProcessManager manager,
            RainWorldGame game)
        {
            orig(self, manager, game);

            var checkBox = new CheckBox(self, self.pages[0], new InputFixEnabledOwner(), new Vector2(100, 0), 100,
                "InputFix enabled?", "INPUTFIXENABLEDPAUSE");
            self.pages[0].subObjects.Add(checkBox);
        }
        */

        private static string SettingFilePath =>
            Path.Combine(Path.Combine(Custom.RootFolderDirectory(), "UserData"), "inputfix.txt");

        private static void SaveSetting()
        {
            File.WriteAllText(SettingFilePath, InputFixEnabled.ToString());
        }

        private static void LoadSetting()
        {
            var filePath = SettingFilePath;
            if (File.Exists(filePath))
            {
                var text = File.ReadAllText(filePath);
                if (bool.TryParse(text, out var b))
                    InputFixEnabled = b;
            }
        }

        private sealed class InputFixEnabledOwner : CheckBox.IOwnCheckBox
        {
            public bool GetChecked(CheckBox box)
            {
                return InputFixEnabled;
            }

            public void SetChecked(CheckBox box, bool c)
            {
                InputFixEnabled = c;
                
                SaveSetting();
                
                Debug.Log($"InputFix enabled: {InputFixEnabled}.");
            }
        }
    }
}