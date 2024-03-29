// Compiled shader for all platforms, uncompressed size: 33.9KB

Shader "Futile/GhostDistortion" {
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
 //        gles : 87 math, 5 texture, 1 branch
 //       gles3 : 87 math, 5 texture, 1 branch
 //   glesdesktop : 87 math, 5 texture, 1 branch
 //       metal : 5 math
 //      opengl : 9 math
 // Stats for Fragment shader:
 //       d3d11 : 63 math, 2 texture, 1 branch
 //        d3d9 : 122 math, 5 texture
 //       metal : 87 math, 5 texture, 1 branch
 //      opengl : 83 math, 5 texture
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
// Stats: 63 math, 2 textures, 1 branches
SetTexture 0 [_NoiseTex2] 2D 1
SetTexture 1 [_GrabTexture] 2D 0
ConstBuffer "$Globals" 80
Vector 16 [_screenSize] 2
Vector 24 [_realRenderScreenSize] 2
Vector 32 [_spriteRect]
Float 48 [_RAIN]
BindCB  "$Globals" 0
"ps_4_0
eefiecedbojhcpfddcdagiilfpapcommilmnapobabaaaaaaomajaaaaadaaaaaa
cmaaaaaaliaaaaaaomaaaaaaejfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklklfdeieefcpiaiaaaaeaaaaaaadoacaaaafjaaaaae
egiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaad
icbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaadiaaaaai
dcaabaaaaaaaaaaaogbkbaaaabaaaaaaegiacaaaaaaaaaaaabaaaaaaebaaaaaf
dcaabaaaaaaaaaaaegaabaaaaaaaaaaaaoaaaaaidcaabaaaaaaaaaaaegaabaaa
aaaaaaaaegiacaaaaaaaaaaaabaaaaaaaaaaaaajdcaabaaaaaaaaaaaegaabaaa
aaaaaaaaegiacaiaebaaaaaaaaaaaaaaacaaaaaaaaaaaaakmcaabaaaaaaaaaaa
agiecaiaebaaaaaaaaaaaaaaacaaaaaakgiocaaaaaaaaaaaacaaaaaaaoaaaaah
dcaabaaaaaaaaaaaegaabaaaaaaaaaaaogakbaaaaaaaaaaaaaaaaaakmcaabaaa
aaaaaaaaagbebaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaalpaaaaaalp
apaaaaahbcaabaaaabaaaaaaogakbaaaaaaaaaaaogakbaaaaaaaaaaaelaaaaaf
ccaabaaaabaaaaaaakaabaaaabaaaaaaaaaaaaahccaabaaaabaaaaaabkaabaaa
abaaaaaabkaabaaaabaaaaaaddaaaaahccaabaaaabaaaaaabkaabaaaabaaaaaa
abeaaaaaaaaaiadpeeaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaah
mcaabaaaaaaaaaaakgaobaaaaaaaaaaaagaabaaaabaaaaaadiaaaaahbcaabaaa
abaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiadodiaaaaaldcaabaaaacaaaaaa
agiacaaaaaaaaaaaadaaaaaaaceaaaaamnmmemdojkjjfbebaaaaaaaaaaaaaaaa
dcaaaaajecaabaaaabaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaaadoakaabaaa
acaaaaaaaaaaaaaldcaabaaaaaaaaaaaegbabaiaebaaaaaaabaaaaaaaceaaaaa
aaaaaadpaaaaaadpaaaaaaaaaaaaaaaaapaaaaahicaabaaaabaaaaaaegaabaaa
aaaaaaaaegaabaaaaaaaaaaaeeaaaaaficaabaaaabaaaaaadkaabaaaabaaaaaa
diaaaaahdcaabaaaaaaaaaaaegaabaaaaaaaaaaapgapbaaaabaaaaaadiaaaaak
dcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaamnmmemdomnmmemdoaaaaaaaa
aaaaaaaadgaaaaaficaabaaaabaaaaaaabeaaaaaaaaaaaaadgaaaaafbcaabaaa
acaaaaaaabeaaaaaaaaaaaaadaaaaaabcbaaaaahecaabaaaacaaaaaaakaabaaa
acaaaaaaabeaaaaaaeaaaaaaadaaaeadckaabaaaacaaaaaaclaaaaafecaabaaa
acaaaaaaakaabaaaacaaaaaadcaaaaajmcaabaaaacaaaaaaagaebaaaaaaaaaaa
kgakbaaaacaaaaaaagaibaaaabaaaaaaefaaaaajpcaabaaaadaaaaaaogakbaaa
acaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaaaaaaaaahicaabaaaabaaaaaa
dkaabaaaabaaaaaaakaabaaaadaaaaaaboaaaaahbcaabaaaacaaaaaaakaabaaa
acaaaaaaabeaaaaaabaaaaaabgaaaaabdcaaaaajbcaabaaaaaaaaaaadkaabaaa
abaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaialpaaaaaaakfcaabaaaabaaaaaa
fgafbaaaabaaaaaaaceaaaaaaaaaaalpaaaaaaaamnmmemloaaaaaaaaaaaaaaah
ccaabaaaaaaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaadeaaaaahccaabaaa
aaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaabeaaaaamdpfeieaenaaaaagccaabaaaaaaaaaaaaanaaaaa
bkaabaaaaaaaaaaadiaaaaahbcaabaaaabaaaaaabkaabaaaaaaaaaaabkaabaaa
aaaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaakaabaaaabaaaaaa
diaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaabaaaaaacpaaaaaf
ccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaaabeaaaaaggggcgdpbjaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
dbaaaaahbcaabaaaabaaaaaabkaabaaaabaaaaaaabeaaaaaaaaaeadpdicaaaah
ecaabaaaabaaaaaackaabaaaabaaaaaaabeaaaaaggggogdpdiaaaaahecaabaaa
abaaaaaackaabaaaabaaaaaackaabaaaabaaaaaadeaaaaahecaabaaaabaaaaaa
bkaabaaaaaaaaaaackaabaaaabaaaaaadhaaaaajccaabaaaaaaaaaaaakaabaaa
abaaaaaackaabaaaabaaaaaabkaabaaaaaaaaaaadiaaaaahfcaabaaaabaaaaaa
agaabaaaaaaaaaaakgalbaaaaaaaaaaadiaaaaakfcaabaaaabaaaaaaagacbaaa
abaaaaaaaceaaaaaaknhcddmaaaaaaaaaknhcddmaaaaaaaadiaaaaahbcaabaaa
aaaaaaaabkaabaaaabaaaaaaabeaaaaaihbgejeaenaaaaagbcaabaaaaaaaaaaa
aanaaaaaakaabaaaaaaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaaaaadiaaaaahfcaabaaaabaaaaaaagaabaaaaaaaaaaaagacbaaa
abaaaaaadcaaaaapfcaabaaaacaaaaaakgblbaaaabaaaaaaaceaaaaaaaaaiadp
aaaaaaaaaaaaialpaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaiadpaaaaaaaa
dcaaaaajfcaabaaaabaaaaaaagacbaaaabaaaaaapgbpbaaaacaaaaaaagacbaaa
acaaaaaadiaaaaahdcaabaaaaaaaaaaafgafbaaaaaaaaaaaogakbaaaaaaaaaaa
diaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaknhcddnaknhcddn
aaaaaaaaaaaaaaaadcaaaaakecaabaaaaaaaaaaabkaabaaaabaaaaaaabeaaaaa
aaaakaebbkaabaiaebaaaaaaacaaaaaaenaaaaagecaabaaaaaaaaaaaaanaaaaa
ckaabaaaaaaaaaaadcaaaaajdcaabaaaaaaaaaaaegaabaaaaaaaaaaakgakbaaa
aaaaaaaaigaabaaaabaaaaaadiaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaa
ogikcaaaaaaaaaaaabaaaaaaebaaaaafdcaabaaaaaaaaaaaegaabaaaaaaaaaaa
aaaaaaakdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadp
aaaaaaaaaaaaaaaaaoaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaogikcaaa
aaaaaaaaabaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaa
abaaaaaaaagabaaaaaaaaaaadeaaaaakhcaabaaaacaaaaaaegacbaaaaaaaaaaa
aceaaaaaifieieloieidaddpmmmleldpaaaaaaaaaaaaaaaibcaabaaaabaaaaaa
bkaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaahbcaabaaaabaaaaaa
akaabaaaabaaaaaaabeaaaaaaaaaaadpdgaaaaaficaabaaaacaaaaaaabeaaaaa
aaaaiadpaaaaaaaipcaabaaaacaaaaaaegaobaiaebaaaaaaaaaaaaaaegaobaaa
acaaaaaadcaaaaajpccabaaaaaaaaaaaagaabaaaabaaaaaaegaobaaaacaaaaaa
egaobaaaaaaaaaaadoaaaaab"
}




}
 }
}
}