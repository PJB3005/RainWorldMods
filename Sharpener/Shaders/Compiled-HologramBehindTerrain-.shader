// Compiled shader for all platforms, uncompressed size: 30.9KB

Shader "Futile/HologramBehindTerrain" {
Properties {
 _MainTex ("Base (RGB) Trans (A)", 2D) = "white" {}
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }


 // Stats for Vertex shader:
 //       d3d11 : 7 math
 //        d3d9 : 9 math
 //        gles : 68 math, 4 texture, 7 branch
 //       gles3 : 68 math, 4 texture, 7 branch
 //   glesdesktop : 68 math, 4 texture, 7 branch
 //       metal : 5 math
 //      opengl : 9 math
 // Stats for Fragment shader:
 //       d3d11 : 43 math, 4 texture, 5 branch
 //        d3d9 : 97 math, 4 texture, 2 branch
 //       metal : 68 math, 4 texture, 7 branch
 //      opengl : 87 math, 4 texture
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
// Stats: 43 math, 4 textures, 5 branches
SetTexture 0 [_LevelTex] 2D 1
SetTexture 1 [_NoiseTex2] 2D 2
SetTexture 2 [_MainTex] 2D 0
ConstBuffer "$Globals" 112
Float 48 [_RAIN]
Vector 64 [_spriteRect]
Vector 80 [_screenSize] 2
BindCB  "$Globals" 0
"ps_4_0
eefiecedkckabilodigdfljcpkegoipigbphgembabaaaaaahiaiaaaaadaaaaaa
cmaaaaaaliaaaaaaomaaaaaaejfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklklfdeieefcieahaaaaeaaaaaaaobabaaaafjaaaaae
egiocaaaaaaaaaaaagaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadpcbabaaa
acaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacafaaaaaadiaaaaaipcaabaaa
aaaaaaaaogbobaaaabaaaaaaegiecaaaaaaaaaaaafaaaaaaebaaaaafpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaaoaaaaaipcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egiecaaaaaaaaaaaafaaaaaaaaaaaaajpcaabaaaaaaaaaaaegaobaaaaaaaaaaa
egiecaiaebaaaaaaaaaaaaaaaeaaaaaaaaaaaaakpcaabaaaabaaaaaaegiecaia
ebaaaaaaaaaaaaaaaeaaaaaaogiocaaaaaaaaaaaaeaaaaaaaoaaaaahpcaabaaa
aaaaaaaaegaobaaaaaaaaaaaegaobaaaabaaaaaaefaaaaajpcaabaaaabaaaaaa
ogakbaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadjaaaaakocaabaaa
abaaaaaaagajbaaaabaaaaaaaceaaaaaaaaaaaaaaaaaiadpaaaaiadpaaaaiadp
dmaaaaahccaabaaaabaaaaaackaabaaaabaaaaaabkaabaaaabaaaaaadmaaaaah
ccaabaaaabaaaaaadkaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaakjcaabaaa
acaaaaaaagambaaaaaaaaaaaaceaaaaaaaaaiaeaaaaaaaaaaaaaaaaamnmmmmdo
diaaaaalhcaabaaaadaaaaaaagiacaaaaaaaaaaaadaaaaaaaceaaaaaaaaacaeb
gpbcaddlnhcdbbedaaaaaaaadcaaaaakccaabaaaacaaaaaabkaabaaaaaaaaaaa
abeaaaaaaaaaaaebakaabaiaebaaaaaaadaaaaaaefaaaaajpcaabaaaaeaaaaaa
egaabaaaacaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaaaaaaaaahbcaabaaa
aaaaaaaaakaabaaaaeaaaaaaakaabaaaaeaaaaaadcaaaaakbcaabaaaaaaaaaaa
dkbabaiaebaaaaaaacaaaaaadkbabaaaacaaaaaaakaabaaaaaaaaaaadcaaaaal
ccaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaaadaaaaaaabeaaaaajkjjbjdo
dkaabaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaa
aaaamiedeaaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaahccaabaaa
aaaaaaaabkaabaaaaaaaaaaaabeaaaaaklkkkkdobnaaaaaiicaabaaaaaaaaaaa
bkaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaabkaaaaagccaabaaaaaaaaaaa
bkaabaiaibaaaaaaaaaaaaaadhaaaaakccaabaaaaaaaaaaadkaabaaaaaaaaaaa
bkaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaabiaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaabeaaaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaiadodhaaaaajbcaabaaaaaaaaaaabkaabaaaaaaaaaaa
dkaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaajecaabaaaacaaaaaackaabaaa
aaaaaaaaabeaaaaaaaaaaadpbkaabaaaadaaaaaaefaaaaajpcaabaaaacaaaaaa
ogakbaaaacaaaaaaeghobaaaabaaaaaaaagabaaaacaaaaaadcaaaaajccaabaaa
aaaaaaaaakaabaaaacaaaaaaabeaaaaaaaaaiaebckaabaaaadaaaaaaenaaaaag
ccaabaaaaaaaaaaaaanaaaaabkaabaaaaaaaaaaadcaaaaajecaabaaaaaaaaaaa
dkbabaaaacaaaaaaabeaaaaaaaaaboecabeaaaaaaaaaaadpcpaaaaagicaabaaa
aaaaaaaabkaabaiaibaaaaaaaaaaaaaadiaaaaahecaabaaaaaaaaaaadkaabaaa
aaaaaaaackaabaaaaaaaaaaabjaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaa
diaaaaahccaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaaj
ecaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaagpbcaddmabeaaaaagpbcaddm
cpaaaaaficaabaaaaaaaaaaadkbabaaaacaaaaaadiaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaaaaaaiadobjaaaaaficaabaaaaaaaaaaadkaabaaa
aaaaaaaadcaaaaakecaabaaaaaaaaaaadkaabaaaaaaaaaaackaabaiaebaaaaaa
aaaaaaaackaabaaaaaaaaaaadiaaaaahbcaabaaaacaaaaaackaabaaaaaaaaaaa
bkaabaaaaaaaaaaadgaaaaafccaabaaaacaaaaaaabeaaaaaaaaaaaaaaaaaaaah
gcaabaaaaaaaaaaaagabbaaaacaaaaaaagbbbaaaabaaaaaaefaaaaajpcaabaaa
acaaaaaajgafbaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaabpaaaead
bkaabaaaabaaaaaadcaaaaajccaabaaaaaaaaaaaakaabaaaabaaaaaaabeaaaaa
aaaahpedabeaaaaaaaaaialpdiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
abeaaaaaijiiaidnbnaaaaaiecaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaia
ebaaaaaaaaaaaaaabkaaaaagccaabaaaaaaaaaaabkaabaiaibaaaaaaaaaaaaaa
dhaaaaakccaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaia
ebaaaaaaaaaaaaaadbaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaa
mnmmemdobpaaaeadbkaabaaaaaaaaaaadgaaaaaipccabaaaaaaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadoaaaaabbfaaaaabbfaaaaabdbaaaaah
bcaabaaaaaaaaaaaabeaaaaaaaaaaadpakaabaaaaaaaaaaabpaaaeadakaabaaa
aaaaaaaadgaaaaaipccabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaadoaaaaabbfaaaaabdgaaaaafhccabaaaaaaaaaaaegbcbaaaacaaaaaa
dgaaaaaficcabaaaaaaaaaaadkaabaaaacaaaaaadoaaaaab"
}




}
 }
}
}