using System.Collections.Generic;
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
}
