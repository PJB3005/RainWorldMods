# ShaderReload - Shader hot reloading
*By PJB*

This mod is some glue code to make modifying Rain World's shaders easier. Because this is intended for modders, you'll have to compile it yourself.

Usage instructions:
1. Make a new Unity project in Unity 4.6.3 (the version of Unity Rain World uses).
2. Change the `ShaderReloadMod.UnityShaderDir` constant in the mod's code to point to the `Temp` folder in the Unity project you just made.
3. Compile the mod, put it in your game. Idk symlink it that's what I do.
4. Get shader files from the game (they raw shader source files are in `Assets/Futile/Resources/Shaders` in the game's directory) and copy them into the Unity project.
5. Change the shader files.
6. Select the shader file you changed in the Unity editor and click "Show all" next to "Compiled code".
7. Unity will output the compiled shader to the `Temp` folder in the project, and the mod will automatically pick the file up and reload the in-game shaders with it.
