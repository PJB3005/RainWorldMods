// Compiled shader for all platforms, uncompressed size: 27.4KB

Shader "Futile/NewVultureSmoke" {
Properties {
 _MainTex ("Base (RGB) Trans (A)", 2D) = "white" {}
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }


 // Stats for Vertex shader:
 //       d3d11 : 7 math
 //        d3d9 : 9 math
 //        gles : 62 math, 5 texture, 1 branch
 //       gles3 : 62 math, 5 texture, 1 branch
 //   glesdesktop : 62 math, 5 texture, 1 branch
 //       metal : 5 math
 //      opengl : 9 math
 // Stats for Fragment shader:
 //       d3d11 : 44 math, 5 texture, 2 branch
 //        d3d9 : 99 math, 5 texture
 //       metal : 62 math, 5 texture, 1 branch
 //      opengl : 75 math, 5 texture
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
// Stats: 44 math, 5 textures, 2 branches
SetTexture 0 [_NoiseTex] 2D 0
SetTexture 1 [_NoiseTex2] 2D 1
ConstBuffer "$Globals" 80
Float 16 [_RAIN]
Vector 32 [_spriteRect]
Vector 48 [_screenSize] 2
BindCB  "$Globals" 0
"ps_4_0
eefiecednkncgpmfdhbfabcdpchmallpijchnghkabaaaaaadmaiaaaaadaaaaaa
cmaaaaaaliaaaaaaomaaaaaaejfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklklfdeieefceiahaaaaeaaaaaaancabaaaafjaaaaae
egiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaad
pcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaeaaaaaadiaaaaai
dcaabaaaaaaaaaaaogbkbaaaabaaaaaaegiacaaaaaaaaaaaadaaaaaaebaaaaaf
dcaabaaaaaaaaaaaegaabaaaaaaaaaaaaoaaaaaidcaabaaaaaaaaaaaegaabaaa
aaaaaaaaegiacaaaaaaaaaaaadaaaaaaaaaaaaajdcaabaaaaaaaaaaaegaabaaa
aaaaaaaaegiacaiaebaaaaaaaaaaaaaaacaaaaaaaaaaaaakmcaabaaaaaaaaaaa
agiecaiaebaaaaaaaaaaaaaaacaaaaaakgiocaaaaaaaaaaaacaaaaaaaoaaaaah
dcaabaaaaaaaaaaaegaabaaaaaaaaaaaogakbaaaaaaaaaaaaaaaaaakmcaabaaa
aaaaaaaaagbebaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaalpaaaaaalp
apaaaaahecaabaaaaaaaaaaaogakbaaaaaaaaaaaogakbaaaaaaaaaaaelaaaaaf
ecaabaaaaaaaaaaackaabaaaaaaaaaaadcaaaaakecaabaaaaaaaaaaackaabaia
ebaaaaaaaaaaaaaaabeaaaaaaaaaaaeaabeaaaaaaaaaiadpdeaaaaahecaabaaa
aaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaaaaadiaaaaaldcaabaaaabaaaaaa
agiacaaaaaaaaaaaabaaaaaaaceaaaaafmipocdpaaaagaeaaaaaaaaaaaaaaaaa
diaaaaakpcaabaaaacaaaaaafgaabaaaaaaaaaaaaceaaaaaggggcgeaddddndea
ggggkgeaddddedebdcaaaaandcaabaaaacaaaaaaagiacaaaaaaaaaaaabaaaaaa
aceaaaaamnmmmmdnaaaaiadoaaaaaaaaaaaaaaaaegaabaaaacaaaaaaefaaaaaj
pcaabaaaadaaaaaacgakbaaaacaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
dcaaaaajicaabaaaaaaaaaaaakaabaaaadaaaaaaabeaaaaaaaaaeaeaakaabaaa
abaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaamdpfmiea
enaaaaagicaabaaaaaaaaaaaaanaaaaadkaabaaaaaaaaaaadcaaaaajicaabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaaadpefaaaaaj
pcaabaaaacaaaaaahgapbaaaacaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
dcaaaaajbcaabaaaabaaaaaaakaabaaaacaaaaaaabeaaaaaaaaaeaeabkaabaaa
abaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaamdpfmiea
enaaaaagbcaabaaaabaaaaaaaanaaaaaakaabaaaabaaaaaadcaaaaajbcaabaaa
abaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaaadpdiaaaaah
icaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaaabaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaai
bcaabaaaabaaaaaaakaabaaaabaaaaaaakiacaaaaaaaaaaaabaaaaaadiaaaaah
bcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaafclijgebenaaaaagbcaabaaa
abaaaaaaaanaaaaaakaabaaaabaaaaaadcaaaaajbcaabaaaabaaaaaaakaabaaa
abaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaaadpdiaaaaahccaabaaaabaaaaaa
dkaabaaaaaaaaaaaakaabaaaabaaaaaadiaaaaahecaabaaaabaaaaaackaabaaa
aaaaaaaabkaabaaaabaaaaaadiaaaaahicaabaaaabaaaaaadkbabaaaacaaaaaa
dkbabaaaacaaaaaadcaaaaajicaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaa
jkjjbjdpabeaaaaamnmmmmdodcaaaaakicaabaaaaaaaaaaadkaabaiaebaaaaaa
aaaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaiadpdcaaaaajicaabaaaaaaaaaaa
dkaabaaaabaaaaaadkaabaaaaaaaaaaabkaabaaaabaaaaaadiaaaaahbcaabaaa
abaaaaaackaabaaaaaaaaaaadkbabaaaacaaaaaaeeaaaaafbcaabaaaabaaaaaa
akaabaaaabaaaaaaaoaaaaakbcaabaaaabaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaiadpakaabaaaabaaaaaadcaaaaakecaabaaaaaaaaaaabkaabaia
ebaaaaaaabaaaaaackaabaaaaaaaaaaadkaabaaaaaaaaaaadcaaaaajecaabaaa
aaaaaaaaakaabaaaabaaaaaackaabaaaaaaaaaaackaabaaaabaaaaaadiaaaaak
dcaabaaaabaaaaaaegaabaaaaaaaaaaaaceaaaaaddddhdebddddpdeaaaaaaaaa
aaaaaaaadcaaaaakecaabaaaabaaaaaaakiacaaaaaaaaaaaabaaaaaaabeaaaaa
mnmmmmdnbkaabaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaigaabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaabaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaia
ebaaaaaaabaaaaaaabeaaaaaddddlddockaabaaaaaaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadcaaaaak
bcaabaaaaaaaaaaaakaabaiaebaaaaaaabaaaaaaabeaaaaajkjjbjdoakaabaaa
aaaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaadkbabaaaacaaaaaa
dbaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaajkjjbjdobpaaaead
akaabaaaaaaaaaaadgaaaaaipccabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaadoaaaaabbfaaaaabdgaaaaafhccabaaaaaaaaaaaegbcbaaa
acaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaiadpdoaaaaab"
}




}
 }
}
}