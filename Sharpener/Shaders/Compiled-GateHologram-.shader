// Compiled shader for all platforms, uncompressed size: 22.5KB

Shader "Futile/GateHologram" {
Properties {
 _MainTex ("Base (RGB) Trans (A)", 2D) = "white" {}
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }


 // Stats for Vertex shader:
 //       d3d11 : 7 math
 //        d3d9 : 9 math
 //        gles : 36 math, 3 texture, 1 branch
 //       gles3 : 36 math, 3 texture, 1 branch
 //   glesdesktop : 36 math, 3 texture, 1 branch
 //       metal : 5 math
 //      opengl : 9 math
 // Stats for Fragment shader:
 //       d3d11 : 27 math, 3 texture, 2 branch
 //        d3d9 : 60 math, 3 texture, 1 branch
 //       metal : 36 math, 3 texture, 1 branch
 //      opengl : 48 math, 3 texture
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
// Stats: 27 math, 3 textures, 2 branches
SetTexture 0 [_NoiseTex2] 2D 1
SetTexture 1 [_MainTex] 2D 0
ConstBuffer "$Globals" 112
Float 48 [_RAIN]
Vector 64 [_spriteRect]
Vector 80 [_screenSize] 2
BindCB  "$Globals" 0
"ps_4_0
eefiecedakifkncibhiecppiaddpkkflhgipaghhabaaaaaakeafaaaaadaaaaaa
cmaaaaaaliaaaaaaomaaaaaaejfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklklfdeieefclaaeaaaaeaaaaaaacmabaaaafjaaaaae
egiocaaaaaaaaaaaagaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaad
pcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaadiaaaaai
pcaabaaaaaaaaaaaogbobaaaabaaaaaaegiecaaaaaaaaaaaafaaaaaaebaaaaaf
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaaoaaaaaipcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegiecaaaaaaaaaaaafaaaaaaaaaaaaajpcaabaaaaaaaaaaaegaobaaa
aaaaaaaaegiecaiaebaaaaaaaaaaaaaaaeaaaaaaaaaaaaakpcaabaaaabaaaaaa
egiecaiaebaaaaaaaaaaaaaaaeaaaaaaogiocaaaaaaaaaaaaeaaaaaaaoaaaaah
pcaabaaaaaaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaadiaaaaakjcaabaaa
abaaaaaaagambaaaaaaaaaaaaceaaaaaaaaaiaeaaaaaaaaaaaaaaaaamnmmmmdo
diaaaaalhcaabaaaacaaaaaaagiacaaaaaaaaaaaadaaaaaaaceaaaaaaaaacaeb
gpbcaddlnhcdbbedaaaaaaaadcaaaaakccaabaaaabaaaaaabkaabaaaaaaaaaaa
abeaaaaaaaaaaaebakaabaiaebaaaaaaacaaaaaaefaaaaajpcaabaaaadaaaaaa
egaabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaaaaaaaaahbcaabaaa
aaaaaaaaakaabaaaadaaaaaaakaabaaaadaaaaaadcaaaaakbcaabaaaaaaaaaaa
dkbabaiaebaaaaaaacaaaaaadkbabaaaacaaaaaaakaabaaaaaaaaaaadbaaaaah
ccaabaaaaaaaaaaaabeaaaaaaaaaaadpakaabaaaaaaaaaaadcaaaaajecaabaaa
abaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaaadpbkaabaaaacaaaaaaefaaaaaj
pcaabaaaabaaaaaaogakbaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaa
dcaaaaajecaabaaaaaaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaiaebckaabaaa
acaaaaaaenaaaaagecaabaaaaaaaaaaaaanaaaaackaabaaaaaaaaaaadcaaaaaj
icaabaaaaaaaaaaadkbabaaaacaaaaaaabeaaaaaaaaaboecabeaaaaaaaaaaadp
cpaaaaagbcaabaaaabaaaaaackaabaiaibaaaaaaaaaaaaaadiaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaakaabaaaabaaaaaabjaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaadiaaaaahecaabaaaaaaaaaaadkaabaaaaaaaaaaackaabaaa
aaaaaaaadcaaaaajbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaagpbcaddm
abeaaaaagpbcaddmcpaaaaaficaabaaaaaaaaaaadkbabaaaacaaaaaadiaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadobjaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaadkaabaaaaaaaaaaa
akaabaiaebaaaaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahbcaabaaaabaaaaaa
akaabaaaaaaaaaaackaabaaaaaaaaaaadgaaaaafccaabaaaabaaaaaaabeaaaaa
aaaaaaaaaaaaaaahfcaabaaaaaaaaaaaagabbaaaabaaaaaaagbbbaaaabaaaaaa
efaaaaajpcaabaaaabaaaaaaigaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaa
aaaaaaaabpaaaeadbkaabaaaaaaaaaaadgaaaaaipccabaaaaaaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadoaaaaabbfaaaaabdgaaaaafhccabaaa
aaaaaaaaegbcbaaaacaaaaaadgaaaaaficcabaaaaaaaaaaadkaabaaaabaaaaaa
doaaaaab"
}




}
 }
}
}