﻿using System.Collections.Generic;
using BepInEx;
using BepInEx.Configuration;
using Menu;
using UnityEngine;

namespace InputFix
{
    [BepInPlugin("pjb3005.input_fix", "InputFix", "0.4.1")]
    public partial class InputFix : BaseUnityPlugin
    {
        private RainWorld _rainWorld;

        private static ConfigEntry<bool> _cfgEnabled;
        private static ConfigEntry<bool> _cfgRumbleEnabled;

        private static readonly Dictionary<KeyCode, string> KeyCodeNames = new Dictionary<KeyCode, string>
        {
            [KeyCode.JoystickButton0] = "A",
            [KeyCode.JoystickButton1] = "B",
            [KeyCode.JoystickButton2] = "X",
            [KeyCode.JoystickButton3] = "Y",
            [KeyCode.JoystickButton4] = "LB",
            [KeyCode.JoystickButton5] = "RB",
            [KeyCode.JoystickButton6] = "Back",
            [KeyCode.JoystickButton7] = "Start",
            [KeyCode.JoystickButton8] = "LSB",
            [KeyCode.JoystickButton9] = "RSB",
            [KeyCode.JoystickButton10] = "LT",
            [KeyCode.JoystickButton11] = "RT"
        };

        public InputFix()
        {
            Config.SaveOnConfigSet = true;

            _cfgEnabled = Config.Bind("InputFix", "Enabled", true);
            _cfgRumbleEnabled = Config.Bind("InputFix", "Enable Rumble", false);

            Debug.Log($"InputFix enabled: {_cfgEnabled.Value}.");

            On.RainWorld.Start += RainWorldOnStart;
            On.Menu.InputOptionsMenu.ctor += InputOptionsMenuOnctor;
            On.Menu.InputOptionsMenu.InputSelectButton.ButtonText += InputSelectButtonOnButtonText;
            // On.Menu.PauseMenu.ctor += PauseMenuOnctor;

            SteamHook.Init();
            InitHooks();

            Debug.Log("InputFix hooked.");

            // On.RoomCamera.Update += RoomCameraOnUpdate;
        }

        private void RainWorldOnStart(On.RainWorld.orig_Start orig, RainWorld self)
        {
            orig(self);

            _rainWorld = self;
        }

        /*
        private static void RoomCameraOnUpdate(On.RoomCamera.orig_Update orig, RoomCamera self)
        {
            orig(self);

            Debug.Log($"[{Time.frameCount:0000000}] {self.screenShake} {self.microShake}");
        }
        */

        private static string InputSelectButtonOnButtonText(
            On.Menu.InputOptionsMenu.InputSelectButton.orig_ButtonText orig,
            Menu.Menu menu,
            bool gamePadBool,
            int player,
            int button)
        {
            if (!DoInputFix || !gamePadBool)
                return orig(menu, gamePadBool, player, button);

            var optionsMenu = (InputOptionsMenu) menu;
            var controls = optionsMenu.manager.rainWorld.options.controls[player];
            var gpButton = controls.gamePadButtons[button];
            var normalized = NormalizeKeycode(gpButton);

            if (!KeyCodeNames.TryGetValue(normalized, out var str))
                // ReSharper disable once ConditionIsAlwaysTrueOrFalse
                return orig(menu, gamePadBool, player, button);

            return str;
        }

        private static void InputOptionsMenuOnctor(
            On.Menu.InputOptionsMenu.orig_ctor orig,
            InputOptionsMenu self,
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

            var menuData = new InputOptionsMenuData();
            menuData.Menu = self;

            var dark = self.inputTesterHolder.darkSprite;
            var checkBox = new CheckBox(self, self.pages[0], new InputFixEnabledOwner(menuData), new Vector2(480, 54), 100,
                "InputFix enabled?", "INPUTFIXENABLED");
            self.pages[0].subObjects.Insert(0, checkBox);

            var checkBoxRumble = new CheckBox(self, self.pages[0], new RumbleEnabledOwner(), new Vector2(480, 26), 100,
                "Rumble support?", "RUMBLEENABLED");
            checkBoxRumble.buttonBehav.greyedOut = !_cfgEnabled.Value;
            self.pages[0].subObjects.Insert(0, checkBoxRumble);

            self.MutualHorizontalButtonBind(self.backButton, checkBox);
            self.MutualHorizontalButtonBind(checkBox, self.testButton);
            self.MutualVerticalButtonBind(checkBoxRumble, checkBox);

            menuData.CheckBoxInputFixEnabled = checkBox;
            menuData.CheckBoxRumbleEnabled = checkBoxRumble;

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

            MoveCheckBoxBehind(checkBox, dark);
            MoveCheckBoxBehind(checkBoxRumble, dark);
        }

        private static void MoveCheckBoxBehind(CheckBox checkBox, FNode behind)
        {
            checkBox.label.label.MoveBehindOtherNode(behind);
            checkBox.symbolSprite.MoveBehindOtherNode(behind);

            foreach (var sprite in checkBox.roundedRect.sprites)
            {
                sprite.MoveBehindOtherNode(behind);
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

        private sealed class InputFixEnabledOwner : CheckBox.IOwnCheckBox
        {
            private readonly InputOptionsMenuData _menu;

            public InputFixEnabledOwner(InputOptionsMenuData menu)
            {
                _menu = menu;
            }

            public bool GetChecked(CheckBox box)
            {
                return _cfgEnabled.Value;
            }

            public void SetChecked(CheckBox box, bool c)
            {
                _cfgEnabled.Value = c;

                UpdateAllGamepadButtonTexts(_menu.Menu);

                _menu.CheckBoxRumbleEnabled.buttonBehav.greyedOut = !c;

                Debug.Log($"InputFix enabled: {_cfgEnabled.Value}.");
            }
        }

        private sealed class RumbleEnabledOwner : CheckBox.IOwnCheckBox
        {
            public bool GetChecked(CheckBox box)
            {
                return _cfgRumbleEnabled.Value;
            }

            public void SetChecked(CheckBox box, bool c)
            {
                _cfgRumbleEnabled.Value = c;
            }
        }


        private static void UpdateAllGamepadButtonTexts(InputOptionsMenu menu)
        {
            foreach (var button in menu.gamePadButtonButtons)
            {
                button.RefreshLabelText();
            }
        }

        private sealed class InputOptionsMenuData
        {
            public InputOptionsMenu Menu;
            public CheckBox CheckBoxInputFixEnabled;
            public CheckBox CheckBoxRumbleEnabled;
        }
    }
}
