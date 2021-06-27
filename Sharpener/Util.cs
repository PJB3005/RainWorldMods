using RWCustom;
using UnityEngine;

namespace Sharpener
{
    public static class Util
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
    }
}
