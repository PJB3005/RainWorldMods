# InputFix - Fixing Controller Handling

This mod replaces the game's controller handling so it should work better with Steam Input.
This means controller handling won't be broken when playing over things like **Steam Remote Play**.

## Installation

1. Make sure you have BepInEx/a mod manager for it installed.
2. Download the mod from [HERE](https://github.com/PJB3005/RainWorldMods/releases/download/inputfix-0.2.1/InputFix.dll).
3. Install the mod in your mod manager.
4. **Make sure Steam Input is enabled, see below.**

## Steam Input

The idea behind this mod is that we give full control to **Steam** (via its XInput API emulation) for game controller handling. This means that Steam's controller handling has to be enabled **fully** for Rain World, or else all InputFix will do is break your controllers. See the following image for how to enable Steam Input for Rain World:

![](SteamInputGame.png)

**NOTE** that if you don't launch Rain World from the Steam Client directly, **this will not work**. You will have to enable Steam Input globally for all controller types you care about, in Steam's settings. The mod will inform you with red text in the game's input settings if this is the case, and if you need to enable this globally.

![img.png](SteamInputGlobal.png)

And then...

![img.png](SteamInputGlobalOptions.png)
