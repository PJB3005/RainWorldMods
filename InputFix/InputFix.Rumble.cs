using System;
using UnityEngine;
using static InputFix.XInput;

namespace InputFix
{
    public partial class InputFix
    {
        private static readonly bool[] RumbleEmpty = new bool[4];

        public void LateUpdate()
        {
            if (!_cfgRumbleEnabled.Value || _rainWorld.processManager.currentMainLoop is not RainWorldGame game)
            {
                ClearRumble();
                return;
            }

            var mask = CalcShakeMask(game);
            var shake = CalcShake(game);
            // Simple non-linear curve so your hands don't fall off from rain.
            shake = Math.Min(Mathf.Sqrt(shake) / 2, shake);

            SetRumble(mask, shake);
        }

        private bool[] CalcShakeMask(RainWorldGame game)
        {
            // Figure out which controllers need to be shaken.
            var mask = new bool[4];

            foreach (var player in game.Players)
            {
                if (player.state is not PlayerState playerState)
                    continue;

                if (player.realizedCreature is not Player p || p.dead)
                    // Sweet (temporary) release of death calms your hands
                    continue;

                var playerControls = _rainWorld.options.controls[playerState.playerNumber];
                if (!playerControls.gamePad)
                    continue;

                if (playerControls.gamePadNumber == 0)
                {
                    mask[0] = true;
                    mask[1] = true;
                    mask[2] = true;
                    mask[3] = true;
                }
                else
                {
                    mask[playerControls.gamePadNumber - 1] = true;
                }
            }

            return mask;
        }

        private static float CalcShake(RainWorldGame game)
        {
            if (game.pauseMenu != null)
                return 0;

            if (game.cameras?.Length is null or < 1)
                return 0;

            return game.cameras[0].ScreenShake;
        }

        private static unsafe void SetRumble(bool[] portMask, float value)
        {
            var vibration = default(XINPUT_VIBRATION);
            vibration.wLeftMotorSpeed = (ushort) (value * ushort.MaxValue);
            vibration.wRightMotorSpeed = (ushort) (value * ushort.MaxValue);

            var vibrationEmpty = default(XINPUT_VIBRATION);

            var portId = 0;
            for (var i = 0u; i < 4; i++)
            {
                if (XInputConnected[i])
                {
                    var ptr = portMask[portId++] ? &vibration : &vibrationEmpty;

                    if (DebugXInput)
                        Debug.Log($"RUMBLE: {i} SET TO {ptr->wLeftMotorSpeed}/{ptr->wRightMotorSpeed}");

                    XInputSetState(i, ptr);
                }
            }
        }

        private static void ClearRumble()
        {
            SetRumble(RumbleEmpty, 0);
        }
    }
}
