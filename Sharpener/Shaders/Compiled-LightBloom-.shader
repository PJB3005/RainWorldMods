// Compiled shader for all platforms, uncompressed size: 36.4KB

Shader "Futile/LightBloom" {
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
 //        gles : 67 math, 9 texture, 6 branch
 //       gles3 : 67 math, 9 texture, 6 branch
 //   glesdesktop : 67 math, 9 texture, 6 branch
 //       metal : 5 math
 //      opengl : 9 math
 // Stats for Fragment shader:
 //       d3d11 : 38 math, 9 texture, 5 branch
 //        d3d9 : 75 math, 9 texture, 9 branch
 //       metal : 67 math, 9 texture, 6 branch
 //      opengl : 221 math, 33 texture
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
// Stats: 38 math, 9 textures, 5 branches
SetTexture 0 [_LevelTex] 2D 1
SetTexture 1 [_GrabTexture] 2D 0
ConstBuffer "$Globals" 80
Vector 32 [_spriteRect]
Vector 48 [_screenSize] 2
BindCB  "$Globals" 0
"ps_4_0
eefiecedkbicnngbfpmcddlkajlimconmjkegajnabaaaaaafmaiaaaaadaaaaaa
cmaaaaaaliaaaaaaomaaaaaaejfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadaaaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklklfdeieefcgiahaaaaeaaaaaaankabaaaafjaaaaae
egiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadicbabaaaacaaaaaagfaaaaad
pccabaaaaaaaaaaagiaaaaacahaaaaaaaaaaaaajdcaabaaaaaaaaaaaogbkbaaa
abaaaaaaegiacaiaebaaaaaaaaaaaaaaacaaaaaaaaaaaaakmcaabaaaaaaaaaaa
agiecaiaebaaaaaaaaaaaaaaacaaaaaakgiocaaaaaaaaaaaacaaaaaaaoaaaaah
gcaabaaaaaaaaaaafgaebaaaaaaaaaaapgaobaaaaaaaaaaaaoaaaaajbcaabaaa
abaaaaaabkiacaaaaaaaaaaaadaaaaaaakiacaaaaaaaaaaaadaaaaaaaaaaaaal
fcaabaaaacaaaaaapgbpbaiaebaaaaaaabaaaaaaaceaaaaaaaaaiadpaaaaaaaa
aaaaiadpaaaaaaaaaaaaaaaiccaabaaaadaaaaaadkbabaiaebaaaaaaabaaaaaa
abeaaaaaaaaaiadpdgaaaaaffcaabaaaaeaaaaaakgbkbaaaabaaaaaadgaaaaai
pcaabaaaafaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaiadpdgaaaaai
ocaabaaaabaaaaaaaceaaaaaaaaaaaaaaaaaiadpaaaaaaaaaaaaaaaadaaaaaab
cbaaaaahicaabaaaacaaaaaadkaabaaaabaaaaaaabeaaaaaaeaaaaaaadaaaead
dkaabaaaacaaaaaaaaaaaaahecaabaaaabaaaaaackaabaaaabaaaaaaabeaaaaa
aaaaiadpdiaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaaifolfbdp
diaaaaahicaabaaaacaaaaaackaabaaaabaaaaaaabeaaaaafcejjndkdcaaaaaj
icaabaaaaaaaaaaackaabaaaabaaaaaaabeaaaaafcejjndkbkaabaaaaaaaaaaa
efaaaaajpcaabaaaagaaaaaaogakbaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaa
abaaaaaadbaaaaahecaabaaaadaaaaaaabeaaaaalfleledoakaabaaaagaaaaaa
dbaaaaahicaabaaaadaaaaaaakaabaaaagaaaaaaabeaaaaaaaaaiadpabaaaaah
ecaabaaaadaaaaaadkaabaaaadaaaaaackaabaaaadaaaaaadcaaaaakccaabaaa
aeaaaaaackaabaiaebaaaaaaabaaaaaaabeaaaaafcejjndkakaabaaaacaaaaaa
efaaaaajpcaabaaaagaaaaaaegaabaaaaeaaaaaaeghobaaaabaaaaaaaagabaaa
aaaaaaaabpaaaeadckaabaaaadaaaaaadcaaaaajpcaabaaaafaaaaaaegaobaaa
agaaaaaafgafbaaaabaaaaaaegaobaaaafaaaaaabfaaaaabdcaaaaakbcaabaaa
aaaaaaaadkaabaiaebaaaaaaacaaaaaaakaabaaaabaaaaaackaabaaaaaaaaaaa
efaaaaajpcaabaaaagaaaaaaegaabaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaa
abaaaaaadbaaaaahecaabaaaadaaaaaaabeaaaaalfleledoakaabaaaagaaaaaa
dbaaaaahicaabaaaadaaaaaaakaabaaaagaaaaaaabeaaaaaaaaaiadpabaaaaah
ecaabaaaadaaaaaadkaabaaaadaaaaaackaabaaaadaaaaaadcaaaaakccaabaaa
acaaaaaadkaabaiaebaaaaaaacaaaaaaakaabaaaabaaaaaackbabaaaabaaaaaa
efaaaaajpcaabaaaagaaaaaajgafbaaaacaaaaaaeghobaaaabaaaaaaaagabaaa
aaaaaaaabpaaaeadckaabaaaadaaaaaadcaaaaajpcaabaaaafaaaaaaegaobaaa
agaaaaaafgafbaaaabaaaaaaegaobaaaafaaaaaabfaaaaabdcaaaaajbcaabaaa
aaaaaaaadkaabaaaacaaaaaaakaabaaaabaaaaaackaabaaaaaaaaaaaefaaaaaj
pcaabaaaagaaaaaaegaabaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaa
dbaaaaahbcaabaaaaaaaaaaaabeaaaaalfleledoakaabaaaagaaaaaadbaaaaah
ccaabaaaacaaaaaaakaabaaaagaaaaaaabeaaaaaaaaaiadpabaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaabkaabaaaacaaaaaadcaaaaajbcaabaaaadaaaaaa
dkaabaaaacaaaaaaakaabaaaabaaaaaackbabaaaabaaaaaaefaaaaajpcaabaaa
agaaaaaaegaabaaaadaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaabpaaaead
akaabaaaaaaaaaaadcaaaaajpcaabaaaafaaaaaaegaobaaaagaaaaaafgafbaaa
abaaaaaaegaobaaaafaaaaaabfaaaaabdcaaaaakicaabaaaaaaaaaaackaabaia
ebaaaaaaabaaaaaaabeaaaaafcejjndkbkaabaaaaaaaaaaaefaaaaajpcaabaaa
agaaaaaaogakbaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadbaaaaah
bcaabaaaaaaaaaaaabeaaaaalfleledoakaabaaaagaaaaaadbaaaaahicaabaaa
aaaaaaaaakaabaaaagaaaaaaabeaaaaaaaaaiadpabaaaaahbcaabaaaaaaaaaaa
dkaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaajicaabaaaaeaaaaaackaabaaa
abaaaaaaabeaaaaafcejjndkakaabaaaacaaaaaaefaaaaajpcaabaaaagaaaaaa
ogakbaaaaeaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaabpaaaeadakaabaaa
aaaaaaaadcaaaaajpcaabaaaafaaaaaaegaobaaaagaaaaaafgafbaaaabaaaaaa
egaobaaaafaaaaaabfaaaaabboaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaa
abeaaaaaabaaaaaabgaaaaabdcaaaaapdcaabaaaaaaaaaaaogbkbaaaabaaaaaa
aceaaaaaaaaaiadpaaaaialpaaaaaaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaiadp
aaaaaaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaa
abaaaaaaaagabaaaaaaaaaaadiaaaaakpcaabaaaabaaaaaaegaobaaaafaaaaaa
aceaaaaacecdendocecdendocecdendocecdendodcaaaaajpccabaaaaaaaaaaa
egaobaaaabaaaaaapgbpbaaaacaaaaaaegaobaaaaaaaaaaadoaaaaab"
}




}
 }
}
}