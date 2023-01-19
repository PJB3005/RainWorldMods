using System;
using BepInEx;
using Menu;
using Mono.Cecil.Cil;
using MonoMod.Cil;

namespace BetterFpsLimit;

[BepInPlugin("pjb3005.better_fps_limit", "Better FPS Limit", "0.1.0")]
public sealed class BetterFpsLimitMod : BaseUnityPlugin
{
    private const int VANILLA_MAX_FPS = 120;
    private const int VANILLA_MIN_FPS = 40;
    private const int MOD_MAX_FPS = 360;

    public void OnEnable()
    {
        try
        {
            IL.Menu.OptionsMenu.SliderSetValue += il =>
            {
                var c = new ILCursor(il);
                c.GotoNext(
                    x => x.MatchLdarg(2),
                    x => x.MatchLdcR4(81.0f));
                c.Index += 1;

                c.Next.Operand = (float)(MOD_MAX_FPS - VANILLA_MIN_FPS + 1);
                Logger.LogDebug(c);

                // ldc.i4.s 120 -> ldc.i4 360
                c.GotoNext(
                    x => x.MatchLdfld<Options>("fpsCap"),
                    x => x.MatchLdcI4(120),
                    x => x.MatchBle(out _));

                c.Index += 1;

                // Original instruction is a .s which can't fit the new value.
                c.Remove();
                c.Emit(OpCodes.Ldc_I4, MOD_MAX_FPS);

                Logger.LogDebug(c);
            };

            IL.Menu.OptionsMenu.ValueOfSlider += il =>
            {
                var c = new ILCursor(il);
                c.GotoNext(
                    x => x.MatchLdcI4(40),
                    x => x.MatchSub(),
                    x => x.MatchConvR4(),
                    x => x.MatchLdcR4(81),
                    x => x.MatchDiv(),
                    x => x.MatchRet());

                c.Index += 3;

                c.Next.Operand = (float)(MOD_MAX_FPS - VANILLA_MIN_FPS + 1);
                Logger.LogDebug(c);
            };

            IL.Menu.OptionsMenu.UpdateInfoText += il =>
            {
                var c = new ILCursor(il);
                c.GotoNext(x => x.MatchLdcI4(120));

                // Original instruction is a .s which can't fit the new value.
                c.Remove();
                c.Emit(OpCodes.Ldc_I4, MOD_MAX_FPS);

                Logger.LogDebug(c);
            };
        }
        catch (Exception e)
        {
            Logger.LogFatal("Exception during init!");
            Logger.LogFatal(e);
        }
    }

    public void OnDisable()
    {
    }
}
