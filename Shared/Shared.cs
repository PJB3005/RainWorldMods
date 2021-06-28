using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using RWCustom;
using UnityEngine;

public static class Shared
{
    public static IntVector2 ToVec(this Resolution resolution)
    {
        return new IntVector2(resolution.width, resolution.height);
    }

    public static IntVector2 Size(this Texture texture)
    {
        return new IntVector2(texture.width, texture.height);
    }

    public static void Deconstruct(this IntVector2 vec, out int x, out int y)
    {
        x = vec.x;
        y = vec.y;
    }

    public static void Deconstruct<TKey, TValue>(
        this KeyValuePair<TKey, TValue> kv,
        out TKey key,
        out TValue value)
    {
        key = kv.Key;
        value = kv.Value;
    }

    public static void MessageBox(string text, string caption = "oops")
    {
        MessageBoxW((nint) 0, text, caption, 0);
    }

    [DllImport("user32.dll")]
    private static extern int MessageBoxW(
        IntPtr hWnd,
        [MarshalAs(UnmanagedType.LPWStr)] string lpText,
        [MarshalAs(UnmanagedType.LPWStr)] string lpCaption,
        uint uType);
}
