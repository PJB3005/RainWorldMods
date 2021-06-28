// Compiled shader for all platforms, uncompressed size: 24.1KB

Shader "Futile/GlyphProjection" {
Properties {
 _MainTex ("Base (RGB) Trans (A)", 2D) = "white" {}
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }


 // Stats for Vertex shader:
 //       d3d11 : 7 math
 //        d3d9 : 9 math
 //        gles : 54 math, 3 texture, 2 branch
 //       gles3 : 54 math, 3 texture, 2 branch
 //   glesdesktop : 54 math, 3 texture, 2 branch
 //       metal : 5 math
 //      opengl : 9 math
 // Stats for Fragment shader:
 //       d3d11 : 28 math, 3 texture, 5 branch
 //        d3d9 : 83 math, 3 texture, 1 branch
 //       metal : 54 math, 3 texture, 2 branch
 //      opengl : 68 math, 3 texture
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
ConstBuffer "$Globals" 80
Vector 64 [_MainTex_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefiecedghmpondecomckjonnofelkflhfaeemaoabaaaaaaeeadaaaaadaaaaaa
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
fdeieefclmabaaaaeaaaabaagpaaaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaa
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
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaaeaaaaaa
ogikcaaaaaaaaaaaaeaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaa
doaaaaab"
}




}
Program "fp" {


SubProgram "d3d11 " {
// Stats: 28 math, 3 textures, 5 branches
SetTexture 0 [_NoiseTex] 2D 1
SetTexture 1 [_MainTex] 2D 0
ConstBuffer "$Globals" 80
Vector 32 [_spriteRect]
Vector 48 [_screenSize] 2
Vector 56 [_gridOffset] 2
BindCB  "$Globals" 0
"ps_4_0
eefiecednmmbpeojcodccpeghoikhkflgepdnmlmabaaaaaaaeagaaaaadaaaaaa
cmaaaaaaliaaaaaaomaaaaaaejfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadaaaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapalaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklklfdeieefcbaafaaaaeaaaaaaaeeabaaaafjaaaaae
egiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadlcbabaaaacaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacadaaaaaadiaaaaakdcaabaaaaaaaaaaaogbkbaaa
abaaaaaaaceaaaaaaaaakpeeaaaaeieeaaaaaaaaaaaaaaaaebaaaaafdcaabaaa
aaaaaaaaegaabaaaaaaaaaaaaoaaaaajmcaabaaaaaaaaaaakgiocaaaaaaaaaaa
adaaaaaaagiecaaaaaaaaaaaadaaaaaadcaaaaandcaabaaaaaaaaaaaegaabaaa
aaaaaaaaaceaaaaaohdodldkaknhkddkaaaaaaaaaaaaaaaaogakbaiaebaaaaaa
aaaaaaaaaaaaaaajdcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaiaebaaaaaa
aaaaaaaaacaaaaaaaaaaaaakmcaabaaaaaaaaaaaagiecaiaebaaaaaaaaaaaaaa
acaaaaaakgiocaaaaaaaaaaaacaaaaaaaoaaaaahdcaabaaaaaaaaaaaegaabaaa
aaaaaaaaogakbaaaaaaaaaaadiaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaa
aceaaaaaklkklkecfgffffecaaaaaaaaaaaaaaaaebaaaaafmcaabaaaaaaaaaaa
agaebaaaaaaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaadkaabaaa
aaaaaaaadcaaaaapdcaabaaaabaaaaaapgapbaaaaaaaaaaaaceaaaaahlpmfodk
omndhbdkaaaaaaaaaaaaaaaaaceaaaaabekoihdonhkdhadoaaaaaaaaaaaaaaaa
dgaaaaaimcaabaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaadpmnmmmmdo
efaaaaajpcaabaaaacaaaaaaigaabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
abaaaaaadcaaaaakicaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaachandhdg
akaabaiaebaaaaaaacaaaaaaenaaaaagicaabaaaaaaaaaaaaanaaaaadkaabaaa
aaaaaaaadcaaaaajbcaabaaaabaaaaaabkbabaaaacaaaaaaabeaaaaakbfijmmg
abeaaaaaimoockehdiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaa
abaaaaaaefaaaaajpcaabaaaabaaaaaangafbaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaabaaaaaadcaaaaakecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaa
kggjlcdfakaabaiaebaaaaaaabaaaaaaenaaaaagecaabaaaaaaaaaaaaanaaaaa
ckaabaaaaaaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaa
egbdmiehbkaaaaafmcaabaaaaaaaaaaakgaobaaaaaaaaaaadbaaaaahecaabaaa
aaaaaaaadkbabaaaacaaaaaackaabaaaaaaaaaaabkaaaaafgcaabaaaabaaaaaa
agabbaaaaaaaaaaadiaaaaahbcaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaa
aaaaeiecebaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahccaabaaa
aaaaaaaabkaabaaaabaaaaaaabeaaaaaaknhkddmdcaaaaajbcaabaaaabaaaaaa
akaabaaaaaaaaaaaabeaaaaaaknhkddmbkaabaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaigaabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaabpaaaead
ckaabaaaaaaaaaaadgaaaaaipccabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaadoaaaaabbfaaaaabdbaaaaahbcaabaaaaaaaaaaaakaabaaa
abaaaaaaabeaaaaaaaaaaadpbiaaaaahccaabaaaaaaaaaaaakbabaaaacaaaaaa
abeaaaaaaaaaaaaacaaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaa
aaaaaaaabpaaaeadakaabaaaaaaaaaaadgaaaaaipccabaaaaaaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaiadpdoaaaaabbcaaaaabdgaaaaaipccabaaa
aaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadoaaaaabbfaaaaab
doaaaaab"
}




}
 }
}
}