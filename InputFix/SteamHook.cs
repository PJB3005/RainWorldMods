using UnityEngine;

namespace InputFix
{
    public static class SteamHook
    {
        public static bool SteamInitialized;

        public static void Init()
        {
            On.SteamManager.Awake += SteamManagerOnAwake;
        }

        private static void SteamManagerOnAwake(On.SteamManager.orig_Awake orig, MonoBehaviour self)
        {
            orig(self);

            var sManager = (SteamManager) self;
            SteamInitialized = sManager.m_bInitialized;
        }
    }
}