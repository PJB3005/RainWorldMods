using System.Collections.Generic;

namespace ShaderReload
{
    public static class Util
    {
        public static void Deconstruct<TKey, TValue>(
            this KeyValuePair<TKey, TValue> kv,
            out TKey key,
            out TValue value)
        {
            key = kv.Key;
            value = kv.Value;
        }
    }
}
