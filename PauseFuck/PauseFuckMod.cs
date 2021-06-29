using System.Linq;
using BepInEx;
using UnityEngine;

namespace PauseFuck
{
    [BepInPlugin("pjb3005.pauseFuck", "PauseFuck", "0.1.0")]
    public class PauseFuckMod : BaseUnityPlugin
    {
        private bool _pauseHidden;
        private RainWorld _rainWorld;

        public PauseFuckMod()
        {
            On.RainWorld.Start += RainWorldOnStart;
            /*On.RainWorldGame.RawUpdate += RainWorldGameOnRawUpdate;*/
        }

        private void RainWorldOnStart(On.RainWorld.orig_Start orig, RainWorld self)
        {
            orig(self);

            _rainWorld = self;
        }

        private void Update()
        {
            if (Input.GetKeyDown(KeyCode.F8))
            {
                if (_rainWorld.processManager.currentMainLoop is not RainWorldGame game)
                    return;

                _pauseHidden ^= true;

                game.pauseMenu.container.isVisible = !_pauseHidden;

                foreach (var container in game.cameras.SelectMany(c => c.hud.fContainers))
                {
                    container.isVisible = !_pauseHidden;
                }
            }
        }

        /*private void RainWorldGameOnRawUpdate(On.RainWorldGame.orig_RawUpdate orig, RainWorldGame self, float dt)
        {
            orig(self, dt);

            if (_lastFps != null)
            {
                self.framesPerSecond = 0;
            }
        }*/
    }
}
