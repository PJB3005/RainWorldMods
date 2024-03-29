// Compiled shader for all platforms, uncompressed size: 24.5KB

Shader "Futile/LightBeam" {
Properties {
 _MainTex ("Base (RGB) Trans (A)", 2D) = "white" {}
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }


 // Stats for Vertex shader:
 //       d3d11 : 7 math
 //        d3d9 : 9 math
 //        gles : 47 math, 2 texture, 5 branch
 //       gles3 : 47 math, 2 texture, 5 branch
 //   glesdesktop : 47 math, 2 texture, 5 branch
 //       metal : 5 math
 //      opengl : 9 math
 // Stats for Fragment shader:
 //       d3d11 : 32 math, 2 texture, 1 branch
 //        d3d9 : 94 math, 2 texture, 1 branch
 //       metal : 47 math, 2 texture, 5 branch
 //      opengl : 79 math, 2 texture
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
ConstBuffer "$Globals" 64
Vector 48 [_MainTex_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefiecedobbfnlbielpdbdjbfkojielgagjmifddabaaaaaaeeadaaaaadaaaaaa
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
fdeieefclmabaaaaeaaaabaagpaaaaaafjaaaaaeegiocaaaaaaaaaaaaeaaaaaa
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
dcaaaaaldccabaaaabaaaaaaegbabaaaadaaaaaaegiacaaaaaaaaaaaadaaaaaa
ogikcaaaaaaaaaaaadaaaaaadgaaaaafpccabaaaacaaaaaaegbobaaaafaaaaaa
doaaaaab"
}




}
Program "fp" {


SubProgram "d3d11 " {
// Stats: 32 math, 2 textures, 1 branches
SetTexture 0 [_LevelTex] 2D 1
SetTexture 1 [_GrabTexture] 2D 0
ConstBuffer "$Globals" 64
Vector 16 [_spriteRect]
Vector 32 [_screenSize] 2
BindCB  "$Globals" 0
"ps_4_0
eefiecedpjjjimnhkimophhiimhgljjfneeoagpmabaaaaaammagaaaaadaaaaaa
cmaaaaaaliaaaaaaomaaaaaaejfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklklfdeieefcniafaaaaeaaaaaaahgabaaaafjaaaaae
egiocaaaaaaaaaaaadaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaad
pcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaadiaaaaai
dcaabaaaaaaaaaaaogbkbaaaabaaaaaaegiacaaaaaaaaaaaacaaaaaaebaaaaaf
dcaabaaaaaaaaaaaegaabaaaaaaaaaaaaoaaaaaidcaabaaaaaaaaaaaegaabaaa
aaaaaaaaegiacaaaaaaaaaaaacaaaaaaaaaaaaajdcaabaaaaaaaaaaaegaabaaa
aaaaaaaaegiacaiaebaaaaaaaaaaaaaaabaaaaaaaaaaaaakmcaabaaaaaaaaaaa
agiecaiaebaaaaaaaaaaaaaaabaaaaaakgiocaaaaaaaaaaaabaaaaaaaoaaaaah
dcaabaaaaaaaaaaaegaabaaaaaaaaaaaogakbaaaaaaaaaaadiaaaaahecaabaaa
aaaaaaaaakbabaaaabaaaaaaabeaaaaamdpfeieaenaaaaagecaabaaaaaaaaaaa
aanaaaaackaabaaaaaaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaa
bkbabaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaaaaaaaaaeghobaaa
aaaaaaaaaagabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaabaaaaaa
abeaaaaaaaaahoedblaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabaaaaah
ccaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaiaceaaaaaibcaabaaa
aaaaaaaaakaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaaeoaaaaaiaanaaaaa
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaboaaaaaaciaaaaaficaabaaa
aaaaaaaaakaabaaaaaaaaaaadhaaaaajbcaabaaaaaaaaaaabkaabaaaaaaaaaaa
dkaabaaaaaaaaaaaakaabaaaaaaaaaaaclaaaaafbcaabaaaaaaaaaaaakaabaaa
aaaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaijiiaidn
biaaaaakhcaabaaaabaaaaaaegacbaaaabaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaaaaaabaaaaahccaabaaaaaaaaaaabkaabaaaabaaaaaaakaabaaa
abaaaaaaabaaaaahccaabaaaaaaaaaaackaabaaaabaaaaaabkaabaaaaaaaaaaa
dhaaaaajbcaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaiadpakaabaaa
aaaaaaaadbaaaaahccaabaaaaaaaaaaaabeaaaaamnmmemdoakaabaaaaaaaaaaa
dcaaaaapdcaabaaaabaaaaaaogbkbaaaabaaaaaaaceaaaaaaaaaiadpaaaaialp
aaaaaaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaiadpaaaaaaaaaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaa
bpaaaeadbkaabaaaaaaaaaaadbaaaaahccaabaaaaaaaaaaaabeaaaaaibiaiadl
akaabaaaabaaaaaadjaaaaakdcaabaaaabaaaaaajgafbaaaabaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadmaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaaakaabaaaabaaaaaadmaaaaahccaabaaaaaaaaaaabkaabaaaabaaaaaa
bkaabaaaaaaaaaaadhaaaaajbcaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaa
mnmmemdoakaabaaaaaaaaaaabfaaaaabdiaaaaahccaabaaaaaaaaaaadkbabaaa
acaaaaaaabeaaaaaaaaaeaeaebaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
blaaaaaficaabaaaaaaaaaaabkaabaaaaaaaaaaaaaaaaaakdcaabaaaabaaaaaa
agaabaaaaaaaaaaaaceaaaaamnmmemloaaaaaalpaaaaaaaaaaaaaaaadicaaaak
dcaabaaaabaaaaaaegaabaaaabaaaaaaaceaaaaaaaaacaebaaaakaebaaaaaaaa
aaaaaaaacaaaaaakjcaabaaaaaaaaaaapgapbaaaaaaaaaaaaceaaaaaabaaaaaa
aaaaaaaaaaaaaaaaacaaaaaadiaaaaahdcaabaaaabaaaaaakgakbaaaaaaaaaaa
egaabaaaabaaaaaadhaaaaajecaabaaaaaaaaaaadkaabaaaaaaaaaaabkaabaaa
abaaaaaackaabaaaaaaaaaaadhaaaaajbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
akaabaaaabaaaaaackaabaaaaaaaaaaadcaaaaakccaabaaaaaaaaaaadkbabaaa
acaaaaaaabeaaaaaaaaaeaeabkaabaiaebaaaaaaaaaaaaaadiaaaaahiccabaaa
aaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadgaaaaafhccabaaaaaaaaaaa
egbcbaaaacaaaaaadoaaaaab"
}




}
 }
}
}