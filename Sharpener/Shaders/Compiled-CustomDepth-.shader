// Compiled shader for all platforms, uncompressed size: 22.4KB

Shader "Futile/CustomDepth" {
Properties {
 _MainTex ("Base (RGB) Trans (A)", 2D) = "white" {}
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }


 // Stats for Vertex shader:
 //       d3d11 : 7 math
 //        d3d9 : 9 math
 //        gles : 31 math, 3 texture, 4 branch
 //       gles3 : 31 math, 3 texture, 4 branch
 //   glesdesktop : 31 math, 3 texture, 4 branch
 //       metal : 5 math
 //      opengl : 9 math
 // Stats for Fragment shader:
 //       d3d11 : 24 math, 3 texture, 3 branch
 //        d3d9 : 59 math, 3 texture, 2 branch
 //       metal : 31 math, 3 texture, 4 branch
 //      opengl : 62 math, 3 texture
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
// Stats: 24 math, 3 textures, 3 branches
SetTexture 0 [_LevelTex] 2D 2
SetTexture 1 [_GrabTexture] 2D 0
SetTexture 2 [_MainTex] 2D 1
ConstBuffer "$Globals" 80
Vector 32 [_spriteRect]
Vector 48 [_screenSize] 2
BindCB  "$Globals" 0
"ps_4_0
eefiecedfplpmpdhemdlchbmlpnhdmgckahhgmdlabaaaaaapiafaaaaadaaaaaa
cmaaaaaaliaaaaaaomaaaaaaejfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklklfdeieefcaeafaaaaeaaaaaaaebabaaaafjaaaaae
egiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafkaaaaadaagabaaaacaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaa
fibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadpcbabaaa
acaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaadiaaaaaidcaabaaa
aaaaaaaaogbkbaaaabaaaaaaegiacaaaaaaaaaaaadaaaaaaebaaaaafdcaabaaa
aaaaaaaaegaabaaaaaaaaaaaaoaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaa
egiacaaaaaaaaaaaadaaaaaaaaaaaaajdcaabaaaaaaaaaaaegaabaaaaaaaaaaa
egiacaiaebaaaaaaaaaaaaaaacaaaaaaaaaaaaakmcaabaaaaaaaaaaaagiecaia
ebaaaaaaaaaaaaaaacaaaaaakgiocaaaaaaaaaaaacaaaaaaaoaaaaahdcaabaaa
aaaaaaaaegaabaaaaaaaaaaaogakbaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaa
egaabaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaaaaaaaaaiicaabaaa
aaaaaaaadkbabaiaebaaaaaaacaaaaaaabeaaaaaaaaaiadpdiaaaaahbcaabaaa
abaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaahpedblaaaaafbcaabaaaabaaaaaa
akaabaaaabaaaaaaboaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaa
ppppppppabaaaaahccaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaaia
ceaaaaaibcaabaaaabaaaaaaakaabaaaabaaaaaaakaabaiaebaaaaaaabaaaaaa
eoaaaaaiaanaaaaabcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaboaaaaaa
ciaaaaafecaabaaaabaaaaaaakaabaaaabaaaaaadhaaaaajbcaabaaaabaaaaaa
bkaabaaaabaaaaaackaabaaaabaaaaaaakaabaaaabaaaaaaclaaaaafbcaabaaa
abaaaaaaakaabaaaabaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaa
abeaaaaaijiiaidnbiaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaa
aaaaiadpaaaaiadpaaaaiadpaaaaaaaaabaaaaahbcaabaaaaaaaaaaabkaabaaa
aaaaaaaaakaabaaaaaaaaaaaabaaaaahbcaabaaaaaaaaaaackaabaaaaaaaaaaa
akaabaaaaaaaaaaadhaaaaajbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
aaaaiadpakaabaaaabaaaaaadbaaaaahccaabaaaaaaaaaaaabeaaaaamnmmemdo
akaabaaaaaaaaaaadcaaaaapdcaabaaaabaaaaaaogbkbaaaabaaaaaaaceaaaaa
aaaaiadpaaaaialpaaaaaaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaiadpaaaaaaaa
aaaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaaaaaaaaabpaaaeadbkaabaaaaaaaaaaadbaaaaahccaabaaaaaaaaaaa
abeaaaaaibiaiadlakaabaaaabaaaaaadjaaaaakdcaabaaaabaaaaaajgafbaaa
abaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadmaaaaahccaabaaa
aaaaaaaabkaabaaaaaaaaaaaakaabaaaabaaaaaadmaaaaahccaabaaaaaaaaaaa
bkaabaaaabaaaaaabkaabaaaaaaaaaaadhaaaaajbcaabaaaaaaaaaaabkaabaaa
aaaaaaaaabeaaaaamnmmemdoakaabaaaaaaaaaaabfaaaaabdbaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaadkaabaaaaaaaaaaabpaaaeadakaabaaaaaaaaaaa
dgaaaaaipccabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
doaaaaabbfaaaaabefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaa
acaaaaaaaagabaaaabaaaaaadgaaaaafhccabaaaaaaaaaaaegbcbaaaacaaaaaa
dgaaaaaficcabaaaaaaaaaaadkaabaaaaaaaaaaadoaaaaab"
}




}
 }
}
}