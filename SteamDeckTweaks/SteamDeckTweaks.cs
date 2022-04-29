using BepInEx;
using BepInEx.Configuration;
using UnityEngine;

namespace SteamDeckTweaks;

[BepInPlugin("pjb3005.steam_deck_tweaks", "SteamDeckTweaks", "0.1.0")]
public sealed class SteamDeckTweaks : BaseUnityPlugin
{
    private readonly ConfigEntry<bool> _cfgEnabled;

    public SteamDeckTweaks()
    {
        On.RainWorldGame.GrafUpdate += RainWorldGameOnGrafUpdate;
        On.MainLoopProcess.RawUpdate += MainLoopProcessOnRawUpdate;

        _cfgEnabled = Config.Bind(
            "Hz lock", "Enabled",
            true,
            "");
    }

    private void MainLoopProcessOnRawUpdate(On.MainLoopProcess.orig_RawUpdate orig, MainLoopProcess self, float dt)
    {
        if (_cfgEnabled.Value && self.framesPerSecond == 40)
        {
            self.myTimeStacker = 1;
            self.Update();
            self.GrafUpdate(self.myTimeStacker);
            return;
        }

        orig(self, dt);
    }

    private void RainWorldGameOnGrafUpdate(On.RainWorldGame.orig_GrafUpdate orig, RainWorldGame self, float timestacker)
    {/*
        if (_cfgEnabled.Value)
            timestacker = 1;

        Logger.LogInfo($"{timestacker:N3} {Screen.currentResolution.refreshRate}");
        */

        orig(self, timestacker);
    }
}
