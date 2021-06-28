// Compiled shader for all platforms, uncompressed size: 47.9KB

Shader "Futile/VoidCeiling" {
Properties {
 _MainTex ("Base (RGB) Trans (A)", 2D) = "white" {}
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }


 // Stats for Vertex shader:
 //       d3d11 : 7 math
 //        d3d9 : 9 math
 //        gles : 141 math, 7 texture, 3 branch
 //       gles3 : 141 math, 7 texture, 3 branch
 //   glesdesktop : 141 math, 7 texture, 3 branch
 //       metal : 5 math
 //      opengl : 9 math
 // Stats for Fragment shader:
 //       d3d11 : 103 math, 7 texture
 //        d3d9 : 167 math, 7 texture
 //       metal : 141 math, 7 texture, 3 branch
 //      opengl : 146 math, 7 texture
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
// Stats: 103 math, 7 textures
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_CloudsTex] 2D 3
SetTexture 2 [_NoiseTex] 2D 2
SetTexture 3 [_PalTex] 2D 4
ConstBuffer "$Globals" 112
Vector 48 [_WorldCamPos] 2
Float 56 [_RAIN]
BindCB  "$Globals" 0
"ps_4_0
eefiecedefcdbmhjnmplgeeecejpjblgggokimohabaaaaaabebaaaaaadaaaaaa
cmaaaaaaliaaaaaaomaaaaaaejfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklklfdeieefccaapaaaaeaaaaaaamiadaaaafjaaaaae
egiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaa
acaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaadaagabaaaaeaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacagaaaaaaaoaaaaakbcaabaaaaaaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpakbabaaaacaaaaaaaoaaaaah
ccaabaaaaaaaaaaaakbabaaaabaaaaaaakbabaaaacaaaaaaaoaaaaahccaabaaa
aaaaaaaabkaabaaaaaaaaaaabkbabaaaacaaaaaadcaaaaakccaabaaaaaaaaaaa
akiacaaaaaaaaaaaadaaaaaaabeaaaaaohdolldkbkaabaaaaaaaaaaadcaaaaaj
bcaabaaaabaaaaaabkaabaaaaaaaaaaaabeaaaaamnmmmmdnckbabaaaacaaaaaa
diaaaaakdcaabaaaacaaaaaaagaabaaaabaaaaaaaceaaaaaaaaaamecaaaaimec
aaaaaaaaaaaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaaa
acaaaaaadcaaaaapmcaabaaaaaaaaaaakgbobaaaabaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaialpaaaaaadpaceaaaaaaaaaaaaaaaaaaaaaaaaaaadpaaaaaaaa
ddaaaaahccaabaaaabaaaaaabkbabaaaabaaaaaaabeaaaaakehahndpefaaaaaj
pcaabaaaadaaaaaaegaabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaa
aaaaaaalpcaabaaaaeaaaaaaogbfbaiaebaaaaaaabaaaaaaaceaaaaaaaaaaadp
aaaaaaaaaaaaiadpnammmmdndiaaaaakocaabaaaadaaaaaapgaebaaaaeaaaaaa
aceaaaaaaaaaaaaaaaaahaebaaaaiadoaaaaaalodeaaaaahecaabaaaabaaaaaa
bkaabaaaadaaaaaaabeaaaaaaaaaaaaaaaaaaaahecaabaaaabaaaaaackaabaaa
abaaaaaaakaabaaaadaaaaaaddaaaaahecaabaaaabaaaaaackaabaaaabaaaaaa
abeaaaaaaaaaiadpdiaaaaahkcaabaaaacaaaaaakgakbaaaabaaaaaaagaebaaa
aeaaaaaadiaaaaalhcaabaaaafaaaaaakgikcaaaaaaaaaaaadaaaaaaaceaaaaa
mnmmmmdmlmhejddmaaaaaadoaaaaaaaadcaaaaakecaabaaaacaaaaaabkaabaaa
abaaaaaaabeaaaaaaaaapaebakaabaiaebaaaaaaafaaaaaadcaaaaamdcaabaaa
acaaaaaangafbaaaacaaaaaaaceaaaaakehaaneakehainlpaaaaaaaaaaaaaaaa
igaabaaaacaaaaaaefaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaa
abaaaaaaaagabaaaadaaaaaadcaaaaajicaabaaaabaaaaaaakaabaaaacaaaaaa
abeaaaaamnmmmmdnabeaaaaamnmmmmdndiaaaaahmcaabaaaaaaaaaaakgaobaaa
aaaaaaaapgapbaaaabaaaaaadcaaaaajccaabaaaaaaaaaaabkaabaaaabaaaaaa
abeaaaaaaaaahaecbkaabaaaafaaaaaadcaaaaajdcaabaaaaaaaaaaaogakbaaa
aaaaaaaakgakbaaaabaaaaaaegaabaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaa
egaabaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaadaaaaaaaaaaaaaiccaabaaa
aaaaaaaaakaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpaaaaaaaiecaabaaa
aaaaaaaaakaabaiaebaaaaaaacaaaaaaabeaaaaaaaaaiadpaaaaaaahicaabaaa
aaaaaaaaakaabaaaacaaaaaaakaabaaaacaaaaaadiaaaaahicaabaaaaaaaaaaa
akaabaaaaaaaaaaadkaabaaaaaaaaaaadbaaaaahbcaabaaaaaaaaaaaabeaaaaa
aaaaaadpakaabaaaaaaaaaaaaaaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaa
ckaabaaaaaaaaaaadcaaaaakccaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaa
bkaabaaaaaaaaaaaabeaaaaaaaaaiadpdhaaaaajbcaabaaaaaaaaaaaakaabaaa
aaaaaaaadkaabaaaaaaaaaaabkaabaaaaaaaaaaaaaaaaaahccaabaaaaaaaaaaa
ckaabaaaabaaaaaackaabaaaabaaaaaadiaaaaahccaabaaaaaaaaaaaakaabaaa
aaaaaaaabkaabaaaaaaaaaaaaaaaaaaiecaabaaaaaaaaaaaakaabaiaebaaaaaa
aaaaaaaaabeaaaaaaaaaiadpaaaaaaaiicaabaaaaaaaaaaackaabaiaebaaaaaa
abaaaaaaabeaaaaaaaaaiadpaaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
dkaabaaaaaaaaaaadcaaaaakicaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaa
ckaabaaaaaaaaaaaabeaaaaaaaaaiadpdbaaaaahicaabaaaabaaaaaaabeaaaaa
aaaaaadpakaabaaaaaaaaaaadhaaaaajccaabaaaaaaaaaaadkaabaaaabaaaaaa
bkaabaaaaaaaaaaadkaabaaaaaaaaaaaaaaaaaaiccaabaaaaaaaaaaackaabaia
ebaaaaaaabaaaaaabkaabaaaaaaaaaaadiaaaaahicaabaaaaaaaaaaabkbabaaa
abaaaaaabkbabaaaabaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
bkbabaaaabaaaaaadcaaaaajccaabaaaaaaaaaaadkaabaaaaaaaaaaabkaabaaa
aaaaaaaackaabaaaabaaaaaadcaaaaajecaabaaaabaaaaaaakaabaaaaaaaaaaa
abeaaaaamnmmemdnbkaabaaaabaaaaaadiaaaaahecaabaaaabaaaaaackaabaaa
abaaaaaaabeaaaaaaaaaiaeadcaaaaajbcaabaaaacaaaaaadkaabaaaadaaaaaa
bkaabaaaaaaaaaaackaabaaaabaaaaaadcaaaaakccaabaaaacaaaaaaakaabaaa
acaaaaaaabeaaaaaaaaaeadpckaabaiaebaaaaaaafaaaaaaaaaaaaahecaabaaa
acaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaadcaaaaajicaabaaaacaaaaaa
ckaabaaaadaaaaaabkaabaaaaaaaaaaackaabaaaacaaaaaadiaaaaahbcaabaaa
acaaaaaadkaabaaaacaaaaaaabeaaaaaaaaaeaeaefaaaaajpcaabaaaadaaaaaa
egaabaaaacaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadiaaaaaldcaabaaa
acaaaaaakgikcaaaaaaaaaaaadaaaaaaaceaaaaamnmmemdndddddddoaaaaaaaa
aaaaaaaadcaaaaajicaabaaaacaaaaaaakaabaaaadaaaaaaabeaaaaafclijgeb
akaabaaaacaaaaaaenaaaaagicaabaaaacaaaaaaaanaaaaadkaabaaaacaaaaaa
dcaaaaajicaabaaaacaaaaaadkaabaaaacaaaaaaabeaaaaaaaaaaadpabeaaaaa
aaaaaadpdiaaaaahpcaabaaaadaaaaaafgafbaaaaaaaaaaaegaebaaaaeaaaaaa
dcaaaaajecaabaaaabaaaaaadkaabaaaadaaaaaaabeaaaaamnmmmmlnckaabaaa
abaaaaaadcaaaaakccaabaaaaeaaaaaackaabaaaabaaaaaaabeaaaaaaaaamadp
bkaabaiaebaaaaaaacaaaaaadcaaaaajecaabaaaabaaaaaackaabaaaadaaaaaa
abeaaaaamnmmemdockaabaaaacaaaaaadcaaaaamdcaabaaaabaaaaaaegaabaaa
adaaaaaaaceaaaaajkjjbjdojkjjjjlnaaaaaaaaaaaaaaaaegaabaaaabaaaaaa
efaaaaajpcaabaaaadaaaaaaegaabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaa
abaaaaaadiaaaaahbcaabaaaaeaaaaaackaabaaaabaaaaaaabeaaaaaaaaamaea
efaaaaajpcaabaaaafaaaaaaegaabaaaaeaaaaaaeghobaaaacaaaaaaaagabaaa
acaaaaaadcaaaaajbcaabaaaabaaaaaaakaabaaaafaaaaaaabeaaaaafclijgeb
akaabaaaacaaaaaaenaaaaagbcaabaaaabaaaaaaaanaaaaaakaabaaaabaaaaaa
dcaaaaajbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaadpabeaaaaa
aaaaaadpdcaaaaakbcaabaaaabaaaaaadkaabaiaebaaaaaaacaaaaaaakaabaaa
abaaaaaaabeaaaaaaaaaiadpdiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaa
akaabaaaabaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaa
abaaaaaadcaaaaaphcaabaaaacaaaaaaagaabaaaabaaaaaaaceaaaaaaaaaaalp
mommmmdnfmipecdoaaaaaaaaaceaaaaaaaaaiadpmnmmemdnaknhcddmaaaaaaaa
cpaaaaafccaabaaaabaaaaaaakaabaaaacaaaaaadiaaaaahccaabaaaabaaaaaa
bkaabaaaabaaaaaaabeaaaaamnmmmmdobjaaaaafccaabaaaabaaaaaabkaabaaa
abaaaaaadiaaaaahccaabaaaabaaaaaaakaabaaaaaaaaaaabkaabaaaabaaaaaa
deaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaaaknhcddmaaaaaaai
ecaabaaaabaaaaaaakaabaiaebaaaaaaadaaaaaaabeaaaaaaaaaiadpaaaaaaah
bcaabaaaacaaaaaaakaabaaaadaaaaaaakaabaaaadaaaaaadiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaakaabaaaacaaaaaaaaaaaaahecaabaaaabaaaaaa
ckaabaaaabaaaaaackaabaaaabaaaaaadcaaaaakecaabaaaaaaaaaaackaabaia
ebaaaaaaabaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaiadpdhaaaaajbcaabaaa
aaaaaaaadkaabaaaabaaaaaaakaabaaaaaaaaaaackaabaaaaaaaaaaadeaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaknhcddmdiaaaaahbcaabaaa
aaaaaaaabkaabaaaabaaaaaaakaabaaaaaaaaaaadiaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaaaaaaiaeaeaaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaadiaaaaahecaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaajkjjjjdn
efaaaaampcaabaaaadaaaaaaaceaaaaaaaaahmdpaaaadadpaaaaaaaaaaaaaaaa
eghobaaaadaaaaaaaagabaaaaeaaaaaadcaaaaanocaabaaaabaaaaaaagaabaia
ebaaaaaaaaaaaaaaaceaaaaaaaaaaaaajkjjjjdnjkjjjjdnjkjjjjdnagajbaaa
adaaaaaadcaaaaajocaabaaaabaaaaaakgakbaaaaeaaaaaafgaobaaaabaaaaaa
kgakbaaaaaaaaaaadiaaaaahbcaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaa
abaaaaaacpaaaaafecaabaaaaaaaaaaaakaabaaaabaaaaaadiaaaaahecaabaaa
aaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaacaebbjaaaaafecaabaaaaaaaaaaa
ckaabaaaaaaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaa
aaaaeaeaeaaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahecaabaaa
aaaaaaaackaabaaaaaaaaaaaabeaaaaaklkkkkdoaaaaaaalhcaabaaaaeaaaaaa
egacbaiaebaaaaaaadaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaiadpaaaaaaaa
dcaaaaajhcaabaaaadaaaaaaagaabaaaaaaaaaaaegacbaaaaeaaaaaaegacbaaa
adaaaaaaaaaaaaaihcaabaaaadaaaaaajgahbaiaebaaaaaaabaaaaaaegacbaaa
adaaaaaadcaaaaajncaabaaaaaaaaaaakgakbaaaaaaaaaaaagajbaaaadaaaaaa
fgaobaaaabaaaaaadccaaaajbcaabaaaabaaaaaaakbabaaaacaaaaaaabeaaaaa
aaaamadpabeaaaaamnmmemdndiaaaaahncaabaaaaaaaaaaaagaobaaaaaaaaaaa
agaabaaaabaaaaaadiaaaaahhccabaaaaaaaaaaaigadbaaaaaaaaaaapgbpbaaa
acaaaaaaaaaaaaaibcaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaiaebaaaaaa
acaaaaaadicaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaajkjjjjdp
cpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaackaabaaaacaaaaaabjaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaeaea
eaaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahiccabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaaklkkkkdodoaaaaab"
}




}
 }
}
}