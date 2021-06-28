// Compiled shader for all platforms, uncompressed size: 28.7KB

Shader "Futile/Spores" {
Properties {
 _MainTex ("Base (RGB) Trans (A)", 2D) = "white" {}
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }


 // Stats for Vertex shader:
 //       d3d11 : 7 math
 //        d3d9 : 9 math
 //        gles : 70 math, 4 texture, 2 branch
 //       gles3 : 70 math, 4 texture, 2 branch
 //   glesdesktop : 70 math, 4 texture, 2 branch
 //       metal : 5 math
 //      opengl : 9 math
 // Stats for Fragment shader:
 //       d3d11 : 50 math, 4 texture, 4 branch
 //        d3d9 : 116 math, 4 texture
 //       metal : 70 math, 4 texture, 2 branch
 //      opengl : 80 math, 4 texture
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
// Stats: 50 math, 4 textures, 4 branches
SetTexture 0 [_NoiseTex] 2D 0
ConstBuffer "$Globals" 80
Float 16 [_RAIN]
Vector 32 [_spriteRect]
Vector 48 [_screenSize] 2
BindCB  "$Globals" 0
"ps_4_0
eefiecedebnipdilinkhmdppjanphfpkllnejajaabaaaaaaniaiaaaaadaaaaaa
cmaaaaaaliaaaaaaomaaaaaaejfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklklfdeieefcoeahaaaaeaaaaaaapjabaaaafjaaaaae
egiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaa
gcbaaaadpcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaa
diaaaaaibcaabaaaaaaaaaaackbabaaaabaaaaaaakiacaaaaaaaaaaaadaaaaaa
ebaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaalocaabaaaaaaaaaaa
agiacaaaaaaaaaaaabaaaaaaaceaaaaaaaaaaaaaddddbjedfmipocdpaaaagaea
dcaaaaakccaabaaaaaaaaaaadkbabaaaabaaaaaabkiacaaaaaaaaaaaadaaaaaa
bkaabaaaaaaaaaaaebaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaaaoaaaaai
dcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaaadaaaaaaaaaaaaaj
dcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaiaebaaaaaaaaaaaaaaacaaaaaa
aaaaaaakdcaabaaaabaaaaaaegiacaiaebaaaaaaaaaaaaaaacaaaaaaogikcaaa
aaaaaaaaacaaaaaaaoaaaaahbcaabaaaacaaaaaaakaabaaaaaaaaaaaakaabaaa
abaaaaaaaoaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaabaaaaaa
aaaaaaahccaabaaaacaaaaaaakaabaaaaaaaaaaaabeaaaaaaknhcddnaaaaaaak
dcaabaaaaaaaaaaaegbabaaaabaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaa
aaaaaaaaapaaaaahbcaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaaaaaaaaaa
elaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaa
akaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaaaeaabeaaaaaaaaaiadpdeaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaadiaaaaakdcaabaaa
abaaaaaaagaabaaaacaaaaaaaceaaaaaddddedebggggkgeaaaaaaaaaaaaaaaaa
diaaaaakmcaabaaaacaaaaaafgafbaaaacaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
ggggcgeaddddndeadcaaaaakecaabaaaabaaaaaaakiacaaaaaaaaaaaabaaaaaa
abeaaaaamnmmmmlnckaabaaaacaaaaaaefaaaaajpcaabaaaadaaaaaajgafbaaa
abaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadcaaaaajccaabaaaaaaaaaaa
akaabaaaadaaaaaaabeaaaaaaaaaeaeackaabaaaaaaaaaaadiaaaaahccaabaaa
aaaaaaaabkaabaaaaaaaaaaaabeaaaaamdpfmieaenaaaaagccaabaaaaaaaaaaa
aanaaaaabkaabaaaaaaaaaaadcaaaaajccaabaaaaaaaaaaabkaabaaaaaaaaaaa
abeaaaaaaaaaaadpabeaaaaaaaaaaadpdcaaaaakccaabaaaabaaaaaaakiacaaa
aaaaaaaaabaaaaaaabeaaaaaaaaaialodkaabaaaacaaaaaaefaaaaajpcaabaaa
abaaaaaaegaabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadcaaaaaj
ecaabaaaaaaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaeaeadkaabaaaaaaaaaaa
diaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaamdpfmieaenaaaaag
ecaabaaaaaaaaaaaaanaaaaackaabaaaaaaaaaaadcaaaaajecaabaaaaaaaaaaa
ckaabaaaaaaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaaadpdiaaaaahccaabaaa
aaaaaaaackaabaaaaaaaaaaabkaabaaaaaaaaaaaefaaaaajpcaabaaaabaaaaaa
egbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaaiecaabaaa
aaaaaaaaakaabaaaabaaaaaaakiacaaaaaaaaaaaabaaaaaadiaaaaahecaabaaa
aaaaaaaackaabaaaaaaaaaaaabeaaaaafclijgebenaaaaagecaabaaaaaaaaaaa
aanaaaaackaabaaaaaaaaaaadcaaaaajecaabaaaaaaaaaaackaabaaaaaaaaaaa
abeaaaaaaaaaaadpabeaaaaaaaaaaadpdiaaaaahicaabaaaaaaaaaaackaabaaa
aaaaaaaabkaabaaaaaaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaaaaaaaaa
dkaabaaaaaaaaaaadcaaaaapgcaabaaaabaaaaaapgbpbaaaacaaaaaaaceaaaaa
aaaaaaaaaaaaaadpmmmmmmloaaaaaaaaaceaaaaaaaaaaaaajkjjjjdodddddddp
aaaaaaaadcaaaaakccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaackaabaaa
aaaaaaaaabeaaaaaaaaaiadpdcaaaaajccaabaaaaaaaaaaabkaabaaaabaaaaaa
bkaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaakccaabaaaaaaaaaaadkaabaia
ebaaaaaaaaaaaaaaakaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaajbcaabaaa
aaaaaaaaakaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaabaaaaaadcaaaaaj
ccaabaaaaaaaaaaaakaabaaaacaaaaaaabeaaaaajflhepebbkaabaaaacaaaaaa
efaaaaajpcaabaaaacaaaaaaegaabaaaacaaaaaaeghobaaaaaaaaaaaaagabaaa
aaaaaaaaaaaaaaaiccaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaiaebaaaaaa
acaaaaaaenaaaaagccaabaaaaaaaaaaaaanaaaaabkaabaaaaaaaaaaadiaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaimoockehbkaaaaafccaabaaa
aaaaaaaabkaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaabkaabaiaebaaaaaa
aaaaaaaackaabaaaabaaaaaaakaabaaaaaaaaaaadiaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadkbabaaaacaaaaaadbaaaaahccaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaddddlddobpaaaeadbkaabaaaaaaaaaaadgaaaaaipccabaaa
aaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadoaaaaabbfaaaaab
dbaaaaahbcaabaaaaaaaaaaaabeaaaaaaaaaaadpakaabaaaaaaaaaaabpaaaead
akaabaaaaaaaaaaadiaaaaakhccabaaaaaaaaaaaegbcbaaaacaaaaaaaceaaaaa
dddddddpdddddddpdddddddpaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaa
aaaaiadpdoaaaaabbfaaaaabdgaaaaafhccabaaaaaaaaaaaegbcbaaaacaaaaaa
dgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaiadpdoaaaaab"
}




}
 }
}
}