// Compiled shader for all platforms, uncompressed size: 22.8KB

Shader "Futile/RedsIllness" {
Properties {
 _MainTex ("Base (RGB) Trans (A)", 2D) = "white" {}
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 GrabPass {
 }


 // Stats for Vertex shader:
 //       d3d11 : 7 math
 //        d3d9 : 9 math
 //        gles : 51 math, 1 texture
 //       gles3 : 51 math, 1 texture
 //   glesdesktop : 51 math, 1 texture
 //       metal : 5 math
 //      opengl : 9 math
 // Stats for Fragment shader:
 //       d3d11 : 40 math, 1 texture
 //        d3d9 : 72 math, 1 texture
 //       metal : 51 math, 1 texture
 //      opengl : 46 math, 1 texture
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
ConstBuffer "$Globals" 48
Vector 32 [_MainTex_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefiecedpjgkdbbjhmdngcpbcladilodbagohjniabaaaaaaeeadaaaaadaaaaaa
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
fdeieefclmabaaaaeaaaabaagpaaaaaafjaaaaaeegiocaaaaaaaaaaaadaaaaaa
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
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaacaaaaaa
ogikcaaaaaaaaaaaacaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaa
doaaaaab"
}




}
Program "fp" {


SubProgram "d3d11 " {
// Stats: 40 math, 1 textures
SetTexture 0 [_GrabTexture] 2D 0
ConstBuffer "$Globals" 48
Vector 16 [_screenSize] 2
BindCB  "$Globals" 0
"ps_4_0
eefiecedjkcfedaokbadmnbfkkijdkbjandmddljabaaaaaajaagaaaaadaaaaaa
cmaaaaaaliaaaaaaomaaaaaaejfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapadaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklklfdeieefcjmafaaaaeaaaaaaaghabaaaafjaaaaae
egiocaaaaaaaaaaaacaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaa
gcbaaaaddcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaa
aaaaaaakdcaabaaaaaaaaaaaegbabaaaabaaaaaaaceaaaaaaaaaaalpaaaaaalp
aaaaaaaaaaaaaaaaapaaaaahecaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaa
aaaaaaaaelaaaaaficaabaaaaaaaaaaackaabaaaaaaaaaaadcaaaaakbcaabaaa
abaaaaaadkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaaaeaabeaaaaaaaaaiadp
deaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaaadiaaaaah
bcaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahbcaabaaa
abaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahbcaabaaaabaaaaaa
akaabaaaabaaaaaaabeaaaaamdpfeieaenaaaaagbcaabaaaabaaaaaaaanaaaaa
akaabaaaabaaaaaacpaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaah
bcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaacaebbjaaaaafbcaabaaa
abaaaaaaakaabaaaabaaaaaaeeaaaaafccaabaaaabaaaaaackaabaaaaaaaaaaa
diaaaaahdcaabaaaaaaaaaaaegaabaaaaaaaaaaafgafbaaaabaaaaaadiaaaaah
dcaabaaaabaaaaaaagaabaaaabaaaaaaegaabaaaaaaaaaaadiaaaaahdcaabaaa
abaaaaaaegaabaaaabaaaaaaagbabaaaacaaaaaadcaaaaapmcaabaaaabaaaaaa
kgbobaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaiadpaaaaialpaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaiadpdcaaaaandcaabaaaabaaaaaaegaabaia
ebaaaaaaabaaaaaaaceaaaaaomfbdidnomfbdidnaaaaaaaaaaaaaaaaogakbaaa
abaaaaaadiaaaaahecaabaaaabaaaaaackaabaaaaaaaaaaackaabaaaaaaaaaaa
diaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaackaabaaaabaaaaaadiaaaaah
dcaabaaaaaaaaaaakgakbaaaaaaaaaaaegaabaaaaaaaaaaadiaaaaahdcaabaaa
aaaaaaaaegaabaaaaaaaaaaaagbabaaaacaaaaaadcaaaaamdcaabaaaaaaaaaaa
egaabaaaaaaaaaaaaceaaaaaaaoakgeeaaoakgeeaaaaaaaaaaaaaaaaegaabaaa
abaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaa
abaaaaaaebaaaaafdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaaaaaaakdcaabaaa
aaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaaaaaaaaaaaa
aoaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaaabaaaaaa
efaaaaajpcaabaaaabaaaaaaegaabaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaa
aaaaaaaadcaaaaapdcaabaaaaaaaaaaafgbfbaaaacaaaaaaaceaaaaaaaaaeaea
gggglgeaaaaaaaaaaaaaaaaaaceaaaaaaaaaeaeajkjjjjdoaaaaaaaaaaaaaaaa
dccaaaandcaabaaaaaaaaaaapgapbaiaebaaaaaaaaaaaaaaegaabaaaaaaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaaaaaaaaaaaaacpaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaa
aaaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaeadp
bjaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaaaaaaialpdcaaaaajbcaabaaaaaaaaaaabkbabaaa
acaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaahbccabaaaaaaaaaaa
akaabaaaaaaaaaaaakaabaaaabaaaaaaaaaaaaaibcaabaaaaaaaaaaabkbabaia
ebaaaaaaacaaaaaaabeaaaaaaaaaiadpdcaaaaakccaabaaaaaaaaaaabkaabaaa
aaaaaaaabkaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaadcaaaaajbcaabaaa
aaaaaaaabkbabaaaacaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaah
gccabaaaaaaaaaaaagaabaaaaaaaaaaafgagbaaaabaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaiadpdoaaaaab"
}




}
 }
}
}