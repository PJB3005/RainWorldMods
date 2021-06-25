using System.IO;
using BepInEx;
using Menu;
using RWCustom;
using UnityEngine;
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

            SteamHook.Init();
            InitHooks();

            Debug.Log("InputFix hooked.");
        }

        private static void InputOptionsMenuOnctor(InputOptionsMenu.orig_ctor orig, Menu.InputOptionsMenu self,
            ProcessManager manager)
        {
            orig(self, manager);
            string labelText;
            if (SteamHook.SteamInitialized)
            {
                labelText = "InputFix loaded, make sure Steam Input is enabled fully - See README.\n" +
                            "Select the XBox input preset for controllers.";
            }
            else
            {
                labelText = "Steam not running/available - InputFix is probably a bad idea.";
            }

            var dark = self.inputTesterHolder.darkSprite;
            var checkBox = new CheckBox(self, self.pages[0], new InputFixEnabledOwner(), new Vector2(480, 54), 100,
                "InputFix enabled?", "INPUTFIXENABLED");
            self.pages[0].subObjects.Insert(0, checkBox);
            checkBox.label.label.MoveBehindOtherNode(dark);
            checkBox.symbolSprite.MoveBehindOtherNode(dark);

            self.MutualHorizontalButtonBind(self.backButton, checkBox);
            self.MutualHorizontalButtonBind(checkBox, self.testButton);


            var label = new MenuLabel(self, self.pages[0],
                labelText,
                new Vector2(450, 46), new Vector2(200, 40), false);
            label.label.alignment = FLabelAlignment.Left;
            label.label.color = Menu.Menu.MenuRGB(Menu.Menu.MenuColors.MediumGrey);
            label.label.MoveBehindOtherNode(dark);
            self.pages[0].subObjects.Insert(0, label);

            if (!SteamHook.RanFromSteam && SteamHook.SteamInitialized)
            {
                var nsLabel = new MenuLabel(
                    self, self.pages[0],
                    "Game not ran from Steam - Steam Input MUST be enabled GLOBALLY",
                    new Vector2(450, 15), new Vector2(200, 40), false);
                nsLabel.label.alignment = FLabelAlignment.Left;
                nsLabel.label.color = Color.red;
                nsLabel.label.MoveBehindOtherNode(dark);
                self.pages[0].subObjects.Insert(0, nsLabel);
            }

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
