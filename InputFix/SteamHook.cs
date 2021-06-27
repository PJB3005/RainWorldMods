using System;
using System.Diagnostics;
using System.Runtime.InteropServices;
using UnityEngine;
using static InputFix.Win32;
using Debug = UnityEngine.Debug;

namespace InputFix
{
    public static unsafe class SteamHook
    {
        public static bool SteamInitialized;
        public static bool RanFromSteam;

        public static void Init()
        {
            On.SteamManager.Awake += SteamManagerOnAwake;
        }

        private static void SteamManagerOnAwake(On.SteamManager.orig_Awake orig, MonoBehaviour self)
        {
            FindSteamModule();

            orig(self);

            var sManager = (SteamManager) self;
            SteamInitialized = sManager.m_bInitialized;
        }

        private static void FindSteamModule()
        {
            Debug.Log("FINDING STEAM MODULE.");

            var ourProcess = Process.GetCurrentProcess();
            var pid = (uint) ourProcess.Id;

            var hSnapShot = CreateToolhelp32Snapshot(TH32CS_SNAPMODULE, pid);

            if (hSnapShot == INVALID_HANDLE_VALUE)
            {
                Debug.Log("CreateToolhelp32Snapshot failed");
                return;
            }

            try
            {
                MODULEENTRY32 me32 = default;
                me32.dwSize = (uint) sizeof(MODULEENTRY32);

                if (!Module32First(hSnapShot, &me32))
                {
                    Debug.Log("Module32First failed");
                    return;
                }

                do
                {
                    var name = Marshal.PtrToStringAnsi((IntPtr) me32.szModule);
                    var path = Marshal.PtrToStringAnsi((IntPtr) me32.szExePath);

                    if (string.Equals(name, "GameOverlayRenderer.dll", StringComparison.InvariantCultureIgnoreCase))
                    {
                        Debug.Log("FOUND STEAM!");
                        RanFromSteam = true;
                    }

                    // Debug.Log($"{name}: {path}");
                } while (Module32Next(hSnapShot, &me32));
            }
            finally
            {
                CloseHandle(hSnapShot);
            }
        }
    }
}
