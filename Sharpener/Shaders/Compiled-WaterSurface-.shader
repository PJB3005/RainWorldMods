// Compiled shader for all platforms, uncompressed size: 23.6KB

Shader "Futile/WaterSurface" {
Properties {
 _MainTex ("Base (RGB) Trans (A)", 2D) = "white" {}
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }


 // Stats for Vertex shader:
 //       d3d11 : 7 math
 //        d3d9 : 9 math
 //        gles : 44 math, 2 texture, 7 branch
 //       gles3 : 44 math, 2 texture, 7 branch
 //   glesdesktop : 44 math, 2 texture, 7 branch
 //       metal : 5 math
 //      opengl : 9 math
 // Stats for Fragment shader:
 //       d3d11 : 26 math, 2 texture, 6 branch
 //        d3d9 : 64 math, 2 texture, 2 branch
 //       metal : 44 math, 2 texture, 7 branch
 //      opengl : 59 math, 2 texture
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
// Stats: 26 math, 2 textures, 6 branches
SetTexture 0 [_LevelTex] 2D 1
SetTexture 1 [_GrabTexture] 2D 0
ConstBuffer "$Globals" 80
Float 16 [_waterDepth]
Vector 32 [_spriteRect]
Vector 48 [_screenSize] 2
BindCB  "$Globals" 0
"ps_4_0
eefiecedgkbaeecmeingokapglnoghilfhndikblabaaaaaaoiafaaaaadaaaaaa
cmaaaaaaliaaaaaaomaaaaaaejfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadacaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklklfdeieefcpeaeaaaaeaaaaaaadnabaaaafjaaaaae
egiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaa
ffffaaaagcbaaaadccbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaad
pcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacacaaaaaadiaaaaai
dcaabaaaaaaaaaaaogbkbaaaabaaaaaaegiacaaaaaaaaaaaadaaaaaaebaaaaaf
dcaabaaaaaaaaaaaegaabaaaaaaaaaaaaoaaaaaidcaabaaaaaaaaaaaegaabaaa
aaaaaaaaegiacaaaaaaaaaaaadaaaaaaaaaaaaajdcaabaaaaaaaaaaaegaabaaa
aaaaaaaaegiacaiaebaaaaaaaaaaaaaaacaaaaaaaaaaaaakmcaabaaaaaaaaaaa
agiecaiaebaaaaaaaaaaaaaaacaaaaaakgiocaaaaaaaaaaaacaaaaaaaoaaaaah
dcaabaaaaaaaaaaaegaabaaaaaaaaaaaogakbaaaaaaaaaaaefaaaaajpcaabaaa
aaaaaaaaegaabaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaadjaaaaak
ocaabaaaaaaaaaaaagajbaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaiadpaaaaiadp
aaaaiadpdmaaaaahccaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaaaaaaaaaa
dmaaaaahccaabaaaaaaaaaaadkaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaap
mcaabaaaaaaaaaaakgbobaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaiadp
aaaaialpaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaiadpefaaaaajpcaabaaa
abaaaaaaogakbaaaaaaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaabpaaaead
bkaabaaaaaaaaaaadcaaaaajbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
aaaahpedabeaaaaaaaaaialpdiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaijiiaidnbnaaaaaiccaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaia
ebaaaaaaaaaaaaaabkaaaaagbcaabaaaaaaaaaaaakaabaiaibaaaaaaaaaaaaaa
dhaaaaakbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaia
ebaaaaaaaaaaaaaadcaaaaalccaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaa
abaaaaaaabeaaaaaaaaapiebabeaaaaaaaaaiadpdcaaaaajccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaabeaaaaafmipmclnbkbabaaaabaaaaaaaaaaaaahccaabaaa
aaaaaaaabkaabaaaaaaaaaaaabeaaaaaaknhkddmdbaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaabkaabaaaaaaaaaaabpaaaeadakaabaaaaaaaaaaadgaaaaai
pccabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadoaaaaab
bfaaaaabbfaaaaabdcaaaaalbcaabaaaaaaaaaaaakiacaiaebaaaaaaaaaaaaaa
abaaaaaaabeaaaaaaaaapiebabeaaaaaaaaaiadpdcaaaaajbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaafmipmclnbkbabaaaabaaaaaaaaaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaaaknhkddmdbaaaaahbcaabaaaaaaaaaaa
abeaaaaamnmmemdoakaabaaaaaaaaaaabpaaaeadakaabaaaaaaaaaaadbaaaaah
bcaabaaaaaaaaaaaabeaaaaaibiaiadlakaabaaaabaaaaaadjaaaaakgcaabaaa
aaaaaaaafgagbaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
dmaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadmaaaaah
bcaabaaaaaaaaaaackaabaaaaaaaaaaaakaabaaaaaaaaaaabpaaaeadakaabaaa
aaaaaaaadgaaaaaipccabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaadoaaaaabbfaaaaabbfaaaaabdgaaaaafpccabaaaaaaaaaaaegbobaaa
acaaaaaadoaaaaab"
}




}
 }
}
}