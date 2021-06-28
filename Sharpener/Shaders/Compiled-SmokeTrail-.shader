// Compiled shader for all platforms, uncompressed size: 20.1KB

Shader "Futile/SmokeTrail" {
Properties {
 _MainTex ("Base (RGB) Trans (A)", 2D) = "white" {}
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }


 // Stats for Vertex shader:
 //       d3d11 : 7 math
 //        d3d9 : 9 math
 //        gles : 35 math, 2 texture, 1 branch
 //       gles3 : 35 math, 2 texture, 1 branch
 //   glesdesktop : 35 math, 2 texture, 1 branch
 //       metal : 5 math
 //      opengl : 9 math
 // Stats for Fragment shader:
 //       d3d11 : 23 math, 2 texture, 2 branch
 //        d3d9 : 43 math, 2 texture
 //       metal : 35 math, 2 texture, 1 branch
 //      opengl : 41 math, 2 texture
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
// Stats: 23 math, 2 textures, 2 branches
SetTexture 0 [_NoiseTex2] 2D 0
ConstBuffer "$Globals" 80
Float 16 [_RAIN]
Vector 32 [_spriteRect]
Vector 48 [_screenSize] 2
BindCB  "$Globals" 0
"ps_4_0
eefiecedpggdbmegmabeoncecagofphonjoieeodabaaaaaapaaeaaaaadaaaaaa
cmaaaaaaliaaaaaaomaaaaaaejfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklklfdeieefcpmadaaaaeaaaaaaappaaaaaafjaaaaae
egiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaa
gcbaaaadpcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaa
diaaaaaibcaabaaaaaaaaaaackbabaaaabaaaaaaakiacaaaaaaaaaaaadaaaaaa
ebaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaalgcaabaaaaaaaaaaa
agiacaaaaaaaaaaaabaaaaaaaceaaaaaaaaaaaaaddddbjedmnmmmmdnaaaaaaaa
dcaaaaalccaabaaaaaaaaaaadkbabaaaabaaaaaabkiacaaaaaaaaaaaadaaaaaa
bkaabaiaebaaaaaaaaaaaaaaebaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
aoaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaaadaaaaaa
aaaaaaajdcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaiaebaaaaaaaaaaaaaa
acaaaaaaaaaaaaakdcaabaaaabaaaaaaegiacaiaebaaaaaaaaaaaaaaacaaaaaa
ogikcaaaaaaaaaaaacaaaaaaaoaaaaahdcaabaaaaaaaaaaaegaabaaaaaaaaaaa
egaabaaaabaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaaaaaaaaaabeaaaaa
ddddhdebdcaaaaajccaabaaaabaaaaaabkaabaaaaaaaaaaaabeaaaaaddddpdea
ckaabaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaadcaaaaakccaabaaaaaaaaaaadkbabaiaebaaaaaa
acaaaaaaabeaaaaadddddddpabeaaaaaaaaaiadpdcaaaaakbcaabaaaaaaaaaaa
akaabaiaebaaaaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaiadpefaaaaaj
pcaabaaaabaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
dcaaaaakbcaabaaaaaaaaaaabkaabaiaebaaaaaaabaaaaaaabeaaaaamnmmemdo
akaabaaaaaaaaaaaaaaaaaaiccaabaaaaaaaaaaaakbabaiaebaaaaaaabaaaaaa
abeaaaaaaaaaaadpdcaaaaakccaabaaaaaaaaaaabkaabaiambaaaaaaaaaaaaaa
abeaaaaaaaaaaaeaabeaaaaaaaaaiadpdiaaaaahbcaabaaaaaaaaaaabkaabaaa
aaaaaaaaakaabaaaaaaaaaaaaaaaaaaiccaabaaaaaaaaaaadkbabaiaebaaaaaa
acaaaaaaabeaaaaaaaaaiadpcpaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaa
diaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaakaebbjaaaaaf
ccaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaajccaabaaaaaaaaaaabkaabaaa
aaaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaaadpdbaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaabkaabaaaaaaaaaaabpaaaeadakaabaaaaaaaaaaadgaaaaai
pccabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadoaaaaab
bfaaaaabdgaaaaafhccabaaaaaaaaaaaegbcbaaaacaaaaaadgaaaaaficcabaaa
aaaaaaaaabeaaaaaaaaaiadpdoaaaaab"
}




}
 }
}
}