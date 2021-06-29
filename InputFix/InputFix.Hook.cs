using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using MonoMod.RuntimeDetour;
using UnityEngine;
using static InputFix.XInput;

namespace InputFix
{
    public partial class InputFix
    {
        private const byte TriggerThreshold = 127;
        private static bool DebugXInput = false;

        public static bool DoInputFix => InputFixEnabled;

        private static Func<KeyCode, bool> _trampolineInputGetKey;
        private static NativeDetour _hookInputGetKey;
        private static Func<KeyCode, bool> _trampolineInputGetKeyUp;
        private static NativeDetour _hookInputGetKeyUp;
        private static Func<KeyCode, bool> _trampolineInputGetKeyDown;
        private static NativeDetour _hookInputGetKeyDown;
        private static Func<string[]> _trampolineInputGetJoystickNames;
        private static NativeDetour _hookInputGetJoystickNames;
        private static Func<string, float> _trampolineInputGetAxisRaw;
        private static NativeDetour _hookInputGetAxisRaw;
        private static Func<bool> _trampolineInputAnyKey;
        private static NativeDetour _hookInputAnyKey;

        // If true, A is the current state for this frame.
        private static bool XInputCurStateA;
        private static readonly DoubleXInputState[] XInputStates = new DoubleXInputState[4];
        private static readonly bool[] XInputConnected = new bool[4];
        private static int _lastFrameCount;

        private static readonly Dictionary<KeyCode, ushort> KeyCodeXInputMap = new Dictionary<KeyCode, ushort>
        {
            [KeyCode.JoystickButton0] = XINPUT_GAMEPAD_A,
            [KeyCode.JoystickButton1] = XINPUT_GAMEPAD_B,
            [KeyCode.JoystickButton2] = XINPUT_GAMEPAD_X,
            [KeyCode.JoystickButton3] = XINPUT_GAMEPAD_Y,
            [KeyCode.JoystickButton4] = XINPUT_GAMEPAD_LEFT_SHOULDER,
            [KeyCode.JoystickButton5] = XINPUT_GAMEPAD_RIGHT_SHOULDER,
            [KeyCode.JoystickButton6] = XINPUT_GAMEPAD_BACK,
            [KeyCode.JoystickButton7] = XINPUT_GAMEPAD_START,
            [KeyCode.JoystickButton8] = XINPUT_GAMEPAD_LEFT_THUMB,
            [KeyCode.JoystickButton9] = XINPUT_GAMEPAD_RIGHT_THUMB
        };

        private static void InitHooks()
        {
            // Input.GetKey(KeyCode)
            MakeNativeHook(
                nameof(Input.GetKey),
                nameof(HookInputGetKey),
                new[] {typeof(KeyCode)},
                out _trampolineInputGetKey,
                out _hookInputGetKey);

            // Input.GetKeyDown(KeyCode)
            MakeNativeHook(
                nameof(Input.GetKeyDown),
                nameof(HookInputGetKeyDown),
                new[] {typeof(KeyCode)},
                out _trampolineInputGetKeyDown,
                out _hookInputGetKeyDown);

            // Input.GetKeyUp(KeyCode)
            MakeNativeHook(
                nameof(Input.GetKeyUp),
                nameof(HookInputGetKeyUp),
                new[] {typeof(KeyCode)},
                out _trampolineInputGetKeyUp,
                out _hookInputGetKeyUp);

            // Input.GetJoystickNames()
            MakeNativeHook(
                nameof(Input.GetJoystickNames),
                nameof(HookInputGetJoystickNames),
                new Type[0],
                out _trampolineInputGetJoystickNames,
                out _hookInputGetJoystickNames);

            // Input.GetAxisRaw(string)
            MakeNativeHook(
                nameof(Input.GetAxisRaw),
                nameof(HookInputGetAxisRaw),
                new[] {typeof(string)},
                out _trampolineInputGetAxisRaw,
                out _hookInputGetAxisRaw);

            // ReSharper disable once PossibleNullReferenceException
            var getAnyKey = typeof(Input).GetProperty(nameof(Input.anyKey)).GetGetMethod();
            MakeNativeHook(
                getAnyKey,
                nameof(HookInputAnyKey),
                out _trampolineInputAnyKey,
                out _hookInputAnyKey);
        }

        private static void MakeNativeHook<TDelegate>(
            string from,
            string to,
            Type[] paramTypes,
            out TDelegate trampoline,
            out NativeDetour detour)
            where TDelegate : Delegate
        {
            var fromMethod = typeof(Input).GetMethod(@from, paramTypes);

            MakeNativeHook(fromMethod, to, out trampoline, out detour);
        }

        private static void MakeNativeHook<TDelegate>(
            MethodBase fromMethod,
            string to,
            out TDelegate trampoline,
            out NativeDetour detour)
            where TDelegate : Delegate
        {
            var toMethod = typeof(InputFix).GetMethod(to, BindingFlags.NonPublic | BindingFlags.Static);

            detour = new NativeDetour(fromMethod, toMethod);
            trampoline = detour.GenerateTrampoline<TDelegate>();
        }

        private static bool HookInputGetKey(KeyCode code)
        {
            if (!PreHookChecks() || code < KeyCode.JoystickButton0)
                return _trampolineInputGetKey(code);

            return GetKeyImpl(code);
        }

        private static bool HookInputGetKeyDown(KeyCode code)
        {
            if (!PreHookChecks() || code < KeyCode.JoystickButton0)
                return _trampolineInputGetKeyDown(code);

            var now = GetKeyImpl(code);
            var last = GetKeyImpl(code, lastFrame: true);
            return now && !last;
        }

        private static bool HookInputGetKeyUp(KeyCode code)
        {
            if (!PreHookChecks() || code < KeyCode.JoystickButton0)
                return _trampolineInputGetKeyUp(code);

            return !GetKeyImpl(code) && GetKeyImpl(code, lastFrame: true);
        }

        private static bool GetKeyImpl(KeyCode code, bool lastFrame=false)
        {
            var port = (code - KeyCode.JoystickButton0) / 20;
            var normalizedCode = NormalizeKeycode(code);

            // Left trigger
            if (normalizedCode == KeyCode.JoystickButton10)
                return GetGamepadInfo(port, gamepad => gamepad.bLeftTrigger > TriggerThreshold ? (bool?) true : null, lastFrame);

            // Right trigger
            if (normalizedCode == KeyCode.JoystickButton11)
                return GetGamepadInfo(port, gamepad => gamepad.bRightTrigger > TriggerThreshold ? (bool?) true : null, lastFrame);

            if (!KeyCodeXInputMap.TryGetValue(normalizedCode, out var mask))
                return false;

            return GetGamepadInfo(port, gamepad => (gamepad.wButtons & mask) != 0 ? (bool?) true : null, lastFrame);
        }

        private static string[] HookInputGetJoystickNames()
        {
            if (!PreHookChecks())
                return _trampolineInputGetJoystickNames();

            return XInputConnected.Select((c, i) => c ? $"XInput controller #{i + 1}" : null)
                .Where(name => name != null)
                .ToArray();
        }

        private static float HookInputGetAxisRaw(string axisName)
        {
            if (!PreHookChecks())
                return _trampolineInputGetAxisRaw(axisName);

            // TODO: Consider improving deadzone value handling?

            // ReSharper disable once StringLiteralTypo
            if (axisName == "DschockHorizontalRight" || axisName == "XboxHorizontalRight")
                return GetRightStick(gp => gp.sThumbRX);

            // ReSharper disable once StringLiteralTypo
            if (axisName == "DschockVerticalRight" || axisName == "XboxVerticalRight")
                return GetRightStick(gp => gp.sThumbRY);

            if (TryDoLeftStick("Horizontal", gamepad => gamepad.sThumbLX, out var axis))
                return axis;

            if (TryDoLeftStick("Vertical", gamepad => gamepad.sThumbLY, out axis))
                return axis;

            if (GetDpad("DschockDpadX", XINPUT_GAMEPAD_DPAD_RIGHT, XINPUT_GAMEPAD_DPAD_LEFT,
                    out var dpadX) ||
                GetDpad("XboxDpadX", XINPUT_GAMEPAD_DPAD_RIGHT, XINPUT_GAMEPAD_DPAD_LEFT, out dpadX))
            {
                return dpadX;
            }

            if (GetDpad("DschockDpadY", XINPUT_GAMEPAD_DPAD_UP, XINPUT_GAMEPAD_DPAD_DOWN,
                    out var dpadY) ||
                GetDpad("XboxDpadY", XINPUT_GAMEPAD_DPAD_UP, XINPUT_GAMEPAD_DPAD_DOWN, out dpadY))
            {
                return dpadY;
            }

            return 0;

            bool TryDoLeftStick(string begin, Func<XINPUT_GAMEPAD, short> get, out float value)
            {
                if (!TryAndParsePort(begin, out var port))
                {
                    value = default;
                    return false;
                }

                value = GetGamepadInfo(port, gamepad =>
                {
                    var val = NormalizeStickInput(get(gamepad));
                    return val == 0 ? null : (float?) val;
                });
                return true;
            }

            bool GetDpad(string begin, ushort maskPos, ushort maskNeg, out float dpadAxis)
            {
                if (!TryAndParsePort(begin, out var port))
                {
                    dpadAxis = default;
                    return false;
                }

                dpadAxis = GetGamepadInfo<float>(port, gamepad =>
                {
                    var buttons = gamepad.wButtons;

                    if ((buttons & maskPos) != 0)
                        return 1f;

                    if ((buttons & maskNeg) != 0)
                        return -1f;

                    return null;
                });

                return true;
            }

            float GetRightStick(Func<XINPUT_GAMEPAD, short> get)
            {
                return GetGamepadInfo(0, gamepad =>
                {
                    var val = NormalizeStickInput(get(gamepad));
                    return val == 0 ? null : (float?) val;
                });
            }

            float NormalizeStickInput(short value, float deadZone = 0.1f)
            {
                var normalized = (float) value / short.MaxValue;
                if (Math.Abs(normalized) < deadZone)
                    return 0;

                return normalized;
            }

            bool TryAndParsePort(string begin, out int port)
            {
                if (!axisName.StartsWith(begin))
                {
                    port = default;
                    return false;
                }

                var suffix = axisName.Substring(begin.Length);
                if (suffix.Length == 0)
                    port = 0;
                else
                    port = int.Parse(suffix);

                return true;
            }
        }

        private static bool HookInputAnyKey()
        {
            if (!PreHookChecks())
                return _trampolineInputAnyKey();

            var baseValue = _trampolineInputAnyKey();
            return baseValue || GetGamepadInfo(0,
                gp => gp.wButtons != 0 ||
                      gp.bLeftTrigger > TriggerThreshold || gp.bRightTrigger > TriggerThreshold
                    ? (bool?) true
                    : null);
        }

        private static T GetGamepadInfo<T>(int port, Func<XINPUT_GAMEPAD, T?> get, bool lastFrame=false) where T : struct
        {
            if (port == 0)
            {
                for (var i = 0; i < 4; i++)
                {
                    if (!XInputConnected[i])
                        continue;

                    var value = get(GetGamepad(i));
                    if (value.HasValue)
                        return value.Value;
                }

                return default;
            }

            // XInput is not guaranteed to pack controllers contiguously,
            // so port 2 can be empty while 1 & 3 are connected.
            // Rain World doesn't expect this so we need to emulate it to be contiguous.
            // Should be noted that I think Unity doesn't make contiguity guarantees either, or it's bugged.
            // So technically I'm fixing an EXTRA bug here!
            var c = port;
            for (var i = 0; i < 4; i++)
            {
                if (!XInputConnected[i])
                    continue;

                if (--c == 0)
                    return get(GetGamepad(i)) ?? default;
            }

            return default;

            ref XINPUT_GAMEPAD GetGamepad(int i)
            {
                ref var stateDouble = ref XInputStates[i];
                var gettingA = XInputCurStateA ^ lastFrame;
                ref var state = ref gettingA ? ref stateDouble.A : ref stateDouble.B;
                return ref state.Gamepad;
            }
        }

        private static bool PreHookChecks()
        {
            if (!DoInputFix)
                return false;

            var frameCount = Time.frameCount;
            if (frameCount != _lastFrameCount)
            {
                // Poll XInput once per frame.
                _lastFrameCount = frameCount;
                XInputCurStateA ^= true;
                UpdateXInputState();
            }

            return true;
        }

        private static unsafe void UpdateXInputState()
        {
            for (var i = 0; i < 4; i++)
            {
                ref var doubleState = ref XInputStates[i];
                ref var stateRef = ref XInputCurStateA ? ref doubleState.A : ref doubleState.B;

                fixed (XINPUT_STATE* state = &stateRef)
                {
                    var lastPacketNum = state->dwPacketNumber;
                    var status = XInputGetState((uint) i, state + i);
                    XInputConnected[i] = status == ERROR_SUCCESS;

                    if (DebugXInput && lastPacketNum != state->dwPacketNumber)
                    {
                        ref var gp = ref state->Gamepad;
                        Debug.Log(
                            $"XINPUT: [{i}]: {gp.wButtons:X8} ({gp.bLeftTrigger:X2}, {gp.bRightTrigger:X2}) ({gp.sThumbLX},{gp.sThumbLY}) ({gp.sThumbRX},{gp.sThumbRY}) ");
                    }
                }
            }
        }

        private static KeyCode NormalizeKeycode(KeyCode code)
        {
            if (code >= KeyCode.Joystick1Button0 && code <= KeyCode.Joystick1Button19)
                code -= 20;
            else if (code >= KeyCode.Joystick2Button0 && code <= KeyCode.Joystick2Button19)
                code -= 40;
            else if (code >= KeyCode.Joystick3Button0 && code <= KeyCode.Joystick3Button19)
                code -= 60;
            else if (code >= KeyCode.Joystick4Button0 && code <= KeyCode.Joystick4Button19)
                code -= 80;

            return code;
        }

        private struct DoubleXInputState
        {
            // We keep track of two states so we can implement GetKeyDown() and GetKeyUp()
            public XINPUT_STATE A;
            public XINPUT_STATE B;
        }
    }
}
