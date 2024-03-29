// Compiled shader for all platforms, uncompressed size: 32.9KB

Shader "Futile/CloudDistant" {
Properties {
 _MainTex ("Base (RGB) Trans (A)", 2D) = "white" {}
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }


 // Stats for Vertex shader:
 //       d3d11 : 7 math
 //        d3d9 : 9 math
 //        gles : 63 math, 5 texture, 3 branch
 //       gles3 : 63 math, 5 texture, 3 branch
 //   glesdesktop : 63 math, 5 texture, 3 branch
 //       metal : 5 math
 //      opengl : 9 math
 // Stats for Fragment shader:
 //       d3d11 : 53 math, 5 texture, 4 branch
 //        d3d9 : 99 math, 5 texture, 2 branch
 //       metal : 63 math, 5 texture, 3 branch
 //      opengl : 92 math, 5 texture
 Pass {
  Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
  BindChannels {
   Bind "vertex", Vertex
   Bind "color", Color
   Bind "texcoord", TexCoord
  }
  ZWrite Off
  Cull Off
  Fog {
   Color (0,0,0,0)
  }
  Blend SrcAlpha OneMinusSrcAlpha
Program "vp" {


SubProgram "d3d11 " {
// Stats: 7 math
Bind "vertex" Vertex
Bind "color" Color
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 112
Vector 96 [_MainTex_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefiecedpenjlbbpmejpnecgfecobllklbmkepmkabaaaaaaeeadaaaaadaaaaaa
cmaaaaaapeaaaaaaiaabaaaaejfdeheomaaaaaaaagaaaaaaaiaaaaaajiaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaakbaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaapaaaaaakjaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
ahaaaaaalaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaadaaaaaaapadaaaalaaaaaaa
abaaaaaaaaaaaaaaadaaaaaaaeaaaaaaapaaaaaaljaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaafaaaaaaapapaaaafaepfdejfeejepeoaafeebeoehefeofeaaeoepfc
enebemaafeeffiedepepfceeaaedepemepfcaaklepfdeheoieaaaaaaaeaaaaaa
aiaaaaaagiaaaaaaaaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaaheaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaamadaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaakl
fdeieefclmabaaaaeaaaabaagpaaaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaa
fjaaaaaeegiocaaaabaaaaaaaeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaad
dcbabaaaadaaaaaafpaaaaadpcbabaaaafaaaaaaghaaaaaepccabaaaaaaaaaaa
abaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaagfaaaaad
pccabaaaacaaaaaagiaaaaacabaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaa
aaaaaaaaegiocaaaabaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaaaaaaaaaagbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaa
dcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaa
egaobaaaaaaaaaaadgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaak
hcaabaaaaaaaaaaaegadbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadp
aaaaaaaaaaaaaaahmccabaaaabaaaaaakgakbaaaaaaaaaaaagaebaaaaaaaaaaa
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaagaaaaaa
ogikcaaaaaaaaaaaagaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaa
doaaaaab"
}




}
Program "fp" {


SubProgram "d3d11 " {
// Stats: 53 math, 5 textures, 4 branches
SetTexture 0 [_LevelTex] 2D 2
SetTexture 1 [_GrabTexture] 2D 0
SetTexture 2 [_MainTex] 2D 1
SetTexture 3 [_CloudsTex] 2D 3
SetTexture 4 [_PalTex] 2D 4
ConstBuffer "$Globals" 112
Vector 32 [_AboveCloudsAtmosphereColor]
Float 48 [_RAIN]
Vector 64 [_spriteRect]
Vector 80 [_screenSize] 2
BindCB  "$Globals" 0
"ps_4_0
eefiecedcfbldbbbcmodemimmimfepbmkofkjmdbabaaaaaahaajaaaaadaaaaaa
cmaaaaaaliaaaaaaomaaaaaaejfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklklfdeieefchmaiaaaaeaaaaaaabpacaaaafjaaaaae
egiocaaaaaaaaaaaagaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaad
aagabaaaaeaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaa
adaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacafaaaaaadiaaaaaidcaabaaaaaaaaaaaogbkbaaa
abaaaaaaegiacaaaaaaaaaaaafaaaaaaebaaaaafdcaabaaaaaaaaaaaegaabaaa
aaaaaaaaaoaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaa
afaaaaaaaaaaaaajdcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaiaebaaaaaa
aaaaaaaaaeaaaaaaaaaaaaakmcaabaaaaaaaaaaaagiecaiaebaaaaaaaaaaaaaa
aeaaaaaakgiocaaaaaaaaaaaaeaaaaaaaoaaaaahdcaabaaaaaaaaaaaegaabaaa
aaaaaaaaogakbaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaa
eghobaaaaaaaaaaaaagabaaaacaaaaaadjaaaaakhcaabaaaaaaaaaaaegacbaaa
aaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaabaaaaahbcaabaaa
aaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaaabaaaaahbcaabaaaaaaaaaaa
ckaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaapgcaabaaaaaaaaaaakgblbaaa
abaaaaaaaceaaaaaaaaaaaaaaaaaiadpaaaaialpaaaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaiadpaaaaaaaaefaaaaajpcaabaaaabaaaaaajgafbaaaaaaaaaaa
eghobaaaabaaaaaaaagabaaaaaaaaaaaaaaaaaahccaabaaaaaaaaaaaakbabaaa
abaaaaaabkbabaaaacaaaaaadiaaaaaiecaabaaaaaaaaaaaakiacaaaaaaaaaaa
adaaaaaaabeaaaaamnmmmmdmaaaaaaaiicaabaaaaaaaaaaaakbabaiaebaaaaaa
acaaaaaaabeaaaaaaaaaiadpdcaaaaakbcaabaaaacaaaaaackaabaiaebaaaaaa
aaaaaaaadkaabaaaaaaaaaaabkaabaaaaaaaaaaaddaaaaahccaabaaaacaaaaaa
bkbabaaaabaaaaaaabeaaaaakehahndpefaaaaajpcaabaaaadaaaaaaegaabaaa
acaaaaaaeghobaaaacaaaaaaaagabaaaabaaaaaadiaaaaahccaabaaaaaaaaaaa
akaabaaaacaaaaaaabeaaaaaaaaakaeaaoaaaaakicaabaaaaaaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaiadpckbabaaaacaaaaaadiaaaaahbcaabaaa
aeaaaaaadkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaajccaabaaaaeaaaaaa
bkaabaaaacaaaaaaabeaaaaaaaaamadpckaabaaaaaaaaaaaefaaaaajpcaabaaa
acaaaaaaegaabaaaaeaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaabpaaaead
akaabaaaaaaaaaaadgaaaaaipccabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaadoaaaaabbfaaaaabdbaaaaahbcaabaaaaaaaaaaaabeaaaaa
ibiaiadlakaabaaaabaaaaaadjaaaaakgcaabaaaaaaaaaaafgagbaaaabaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadmaaaaahbcaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakaabaaaaaaaaaaadmaaaaahbcaabaaaaaaaaaaackaabaaa
aaaaaaaaakaabaaaaaaaaaaabpaaaeadakaabaaaaaaaaaaadgaaaaaipccabaaa
aaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadoaaaaabbfaaaaab
dbaaaaahbcaabaaaaaaaaaaaabeaaaaaaaaaaadpakaabaaaacaaaaaaaaaaaaah
ccaabaaaaaaaaaaaakaabaaaadaaaaaaakaabaaaadaaaaaadiaaaaahccaabaaa
aaaaaaaaakaabaaaacaaaaaabkaabaaaaaaaaaaaaaaaaaaiecaabaaaaaaaaaaa
akaabaiaebaaaaaaadaaaaaaabeaaaaaaaaaiadpaaaaaaahecaabaaaaaaaaaaa
ckaabaaaaaaaaaaackaabaaaaaaaaaaaaaaaaaaiicaabaaaaaaaaaaaakaabaia
ebaaaaaaacaaaaaaabeaaaaaaaaaiadpdcaaaaakecaabaaaaaaaaaaackaabaia
ebaaaaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadpdhaaaaajbcaabaaa
aaaaaaaaakaabaaaaaaaaaaabkaabaaaaaaaaaaackaabaaaaaaaaaaaaaaaaaah
ccaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaajkjjjjlodiaaaaahccaabaaa
aaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaamaeadeaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaabeaaaaaaaaaaadpddaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaaabeaaaaaaaaaiadpdiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
bkaabaaaadaaaaaaefaaaaampcaabaaaabaaaaaaaceaaaaaaaaaiadmaaaahadp
aaaaaaaaaaaaaaaaeghobaaaaeaaaaaaaagabaaaaeaaaaaadiaaaaahccaabaaa
aaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaiaeaeaaaaaafccaabaaaaaaaaaaa
bkaabaaaaaaaaaaadcaaaaajccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaa
jkjjjjloabeaaaaamnmmmmdpcpaaaaafhcaabaaaabaaaaaaegacbaaaabaaaaaa
diaaaaahhcaabaaaabaaaaaafgafbaaaaaaaaaaaegacbaaaabaaaaaabjaaaaaf
hcaabaaaabaaaaaaegacbaaaabaaaaaaaaaaaaajocaabaaaacaaaaaaagajbaia
ebaaaaaaabaaaaaaagijcaaaaaaaaaaaacaaaaaadcaaaaajhccabaaaaaaaaaaa
agbabaaaacaaaaaajgahbaaaacaaaaaaegacbaaaabaaaaaadcaaaaajccaabaaa
aaaaaaaaakaabaaaacaaaaaaabeaaaaadeddjdlpabeaaaaajkjjjjdpcpaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaabkaabaaaaaaaaaaabjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
diaaaaahccaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaamnmmemdodcaaaaak
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaakadpbkaabaiaebaaaaaa
aaaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaeaea
eaaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadkbabaaaacaaaaaadiaaaaahiccabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaklkkkkdodoaaaaab"
}




}
 }
}
}