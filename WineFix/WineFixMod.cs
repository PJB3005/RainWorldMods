using System;
using System.Runtime.InteropServices;
using BepInEx;
using Microsoft.Win32;
using UnityEngine;

namespace WineFix;

[BepInPlugin("pjb3005.winefix", "winefix", "0.1.0")]
public sealed class WineFixMod : BaseUnityPlugin
{
    private void OnEnable()
    {
        try
        {
            WineFixer.Fix();
            Logger.LogInfo("Succeeded fixing wine!");
        }
        catch (Exception)
        {
            Logger.LogError("Error fixing wine!");
        }
    }
}

public static class WineFixer
{
    public static void Fix()
    {
        if (!CheckIfWine())
            return;

        Debug.Log("Wine detected: fixing BepInEx next launch by setting DLL override for winhttp to 'native,builtin'");
        const string key = @"HKEY_CURRENT_USER\Software\Wine\AppDefaults\RainWorld.exe\DllOverrides";
        Registry.SetValue(key, "winhttp", "native,builtin", RegistryValueKind.String);
    }

    private static bool CheckIfWine()
    {
        try
        {
            // Will throw if not on Wine/Proton.
            wine_get_version();
            return true;
        }
        catch (Exception)
        {
            // Not on Wine/Proton.
            return false;
        }
    }

    [DllImport("ntdll.dll", CallingConvention = CallingConvention.Cdecl, ExactSpelling = true)]
    public static extern IntPtr wine_get_version();
}
