// Compiled shader for all platforms, uncompressed size: 40.7KB

Shader "Futile/LocalBloom" {
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
 //        gles : 79 math, 9 texture, 3 branch
 //       gles3 : 79 math, 9 texture, 3 branch
 //   glesdesktop : 79 math, 9 texture, 3 branch
 //       metal : 5 math
 //      opengl : 9 math
 // Stats for Fragment shader:
 //       d3d11 : 49 math, 25 texture, 2 branch
 //        d3d9 : 64 math, 9 texture, 6 branch
 //       metal : 79 math, 9 texture, 3 branch
 //      opengl : 142 math, 25 texture
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
// Stats: 49 math, 25 textures, 2 branches
SetTexture 0 [_GrabTexture] 2D 0
ConstBuffer "$Globals" 80
Vector 48 [_screenSize] 2
BindCB  "$Globals" 0
"ps_4_0
eefiecednpfiajcoocnenlckpdaebgmnpcafglhmabaaaaaapaanaaaaadaaaaaa
cmaaaaaaliaaaaaaomaaaaaaejfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaiaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklklfdeieefcpmamaaaaeaaaaaaadpadaaaafjaaaaae
egiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafibiaaaeaahabaaa
aaaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaa
gcbaaaadicbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacbkaaaaaa
aaaaaaakdcaabaaaaaaaaaaaegbabaaaabaaaaaaaceaaaaaaaaaaalpaaaaaalp
aaaaaaaaaaaaaaaaapaaaaahbcaabaaaaaaaaaaaegaabaaaaaaaaaaaegaabaaa
aaaaaaaaelaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadbaaaaahccaabaaa
aaaaaaaaabeaaaaaaaaaaadpakaabaaaaaaaaaaaaoaaaaajecaabaaaaaaaaaaa
bkiacaaaaaaaaaaaadaaaaaaakiacaaaaaaaaaaaadaaaaaadcaaaaappcaabaaa
abaaaaaaogbobaaaabaaaaaaaceaaaaaaaaaiadpaaaaialpaaaaiadpaaaaialp
aceaaaaaaaaaaaaafllbhpdpaaaaaaaafcchiadpefaaaaajpcaabaaaacaaaaaa
egaabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadcaaaaanhcaabaaa
adaaaaaakgakbaiaebaaaaaaaaaaaaaaaceaaaaaplongldlfcejjndkfcejbndl
aaaaaaaakgbkbaaaabaaaaaaaaaaaaaiicaabaaaadaaaaaadkbabaiaebaaaaaa
abaaaaaaabeaaaaaaaaaiadpefaaaaajpcaabaaaaeaaaaaangafbaaaadaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaadcaaaaamhcaabaaaafaaaaaakgakbaaa
aaaaaaaaaceaaaaaplongldlfcejjndkfcejbndlaaaaaaaakgbkbaaaabaaaaaa
aaaaaaaiicaabaaaafaaaaaadkbabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadp
efaaaaajpcaabaaaagaaaaaangafbaaaafaaaaaaeghobaaaaaaaaaaaaagabaaa
aaaaaaaaefaaaaajpcaabaaaabaaaaaaogakbaaaabaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaadgaaaaafbcaabaaaahaaaaaabkaabaaaadaaaaaaaaaaaaal
gcaabaaaahaaaaaapgbpbaiaebaaaaaaabaaaaaaaceaaaaaaaaaaaaafllbhpdp
fcchiadpaaaaaaaaefaaaaajpcaabaaaaiaaaaaaegaabaaaahaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaaefaaaaajpcaabaaaahaaaaaaigaabaaaahaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaadgaaaaafbcaabaaaajaaaaaabkaabaaa
afaaaaaaaaaaaaalgcaabaaaajaaaaaapgbpbaiaebaaaaaaabaaaaaaaceaaaaa
aaaaaaaafllbhpdpfcchiadpaaaaaaaaefaaaaajpcaabaaaakaaaaaaegaabaaa
ajaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaefaaaaajpcaabaaaajaaaaaa
igaabaaaajaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadcaaaaappcaabaaa
alaaaaaaogbobaaaabaaaaaaaceaaaaaaaaaiadpaaaaialpaaaaiadpaaaaialp
aceaaaaaaaaaaaaalhgchpdpaaaaaaaakfeoiadpefaaaaajpcaabaaaamaaaaaa
egaabaaaalaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaefaaaaajpcaabaaa
anaaaaaaogakbaaaadaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaefaaaaaj
pcaabaaaaoaaaaaaogakbaaaafaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
efaaaaajpcaabaaaalaaaaaaogakbaaaalaaaaaaeghobaaaaaaaaaaaaagabaaa
aaaaaaaadgaaaaafbcaabaaaapaaaaaackaabaaaadaaaaaaaaaaaaalgcaabaaa
apaaaaaapgbpbaiaebaaaaaaabaaaaaaaceaaaaaaaaaaaaalhgchpdpkfeoiadp
aaaaaaaaefaaaaajpcaabaaabaaaaaaaegaabaaaapaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaaefaaaaajpcaabaaaapaaaaaaigaabaaaapaaaaaaeghobaaa
aaaaaaaaaagabaaaaaaaaaaadgaaaaafbcaabaaabbaaaaaackaabaaaafaaaaaa
aaaaaaalgcaabaaabbaaaaaapgbpbaiaebaaaaaaabaaaaaaaceaaaaaaaaaaaaa
lhgchpdpkfeoiadpaaaaaaaaefaaaaajpcaabaaabcaaaaaaegaabaaabbaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaaefaaaaajpcaabaaabbaaaaaaigaabaaa
bbaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaadcaaaaappcaabaaabdaaaaaa
ogbobaaaabaaaaaaaceaaaaaaaaaiadpaaaaialpaaaaiadpaaaaialpaceaaaaa
aaaaaaaabcbehpdpaaaaaaaaphhfiadpefaaaaajpcaabaaabeaaaaaaegaabaaa
bdaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaefaaaaajpcaabaaabfaaaaaa
mgaabaaaadaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaefaaaaajpcaabaaa
bgaaaaaamgaabaaaafaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaefaaaaaj
pcaabaaabdaaaaaaogakbaaabdaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaa
aaaaaaalgcaabaaaadaaaaaapgbpbaiaebaaaaaaabaaaaaaaceaaaaaaaaaaaaa
bcbehpdpphhfiadpaaaaaaaaefaaaaajpcaabaaabhaaaaaaegaabaaaadaaaaaa
eghobaaaaaaaaaaaaagabaaaaaaaaaaaefaaaaajpcaabaaaadaaaaaaigaabaaa
adaaaaaaeghobaaaaaaaaaaaaagabaaaaaaaaaaaaaaaaaalgcaabaaaafaaaaaa
pgbpbaiaebaaaaaaabaaaaaaaceaaaaaaaaaaaaabcbehpdpphhfiadpaaaaaaaa
efaaaaajpcaabaaabiaaaaaaegaabaaaafaaaaaaeghobaaaaaaaaaaaaagabaaa
aaaaaaaaefaaaaajpcaabaaaafaaaaaaigaabaaaafaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaadcaaaaapmcaabaaaaaaaaaaakgbobaaaabaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaiadpaaaaialpaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaiadpefaaaaajpcaabaaabjaaaaaaogakbaaaaaaaaaaaeghobaaaaaaaaaaa
aagabaaaaaaaaaaabpaaaeadbkaabaaaaaaaaaaadgaaaaaipccabaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadoaaaaabbfaaaaabdcaaaaap
pcaabaaaacaaaaaaegaobaaaacaaaaaaaceaaaaakoehgbdpkoehgbdpkoehgbdp
koehgbdpaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaiadpdcaaaaampcaabaaa
acaaaaaaegaobaaaaeaaaaaaaceaaaaakoehgbdpkoehgbdpkoehgbdpkoehgbdp
egaobaaaacaaaaaadcaaaaampcaabaaaacaaaaaaegaobaaaagaaaaaaaceaaaaa
koehgbdpkoehgbdpkoehgbdpkoehgbdpegaobaaaacaaaaaadcaaaaampcaabaaa
abaaaaaaegaobaaaabaaaaaaaceaaaaakoehgbdpkoehgbdpkoehgbdpkoehgbdp
egaobaaaacaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaaiaaaaaaaceaaaaa
mkcpbgdpmkcpbgdpmkcpbgdpmkcpbgdpegaobaaaabaaaaaadcaaaaampcaabaaa
abaaaaaaegaobaaaahaaaaaaaceaaaaamkcpbgdpmkcpbgdpmkcpbgdpmkcpbgdp
egaobaaaabaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaakaaaaaaaceaaaaa
mkcpbgdpmkcpbgdpmkcpbgdpmkcpbgdpegaobaaaabaaaaaadcaaaaampcaabaaa
abaaaaaaegaobaaaajaaaaaaaceaaaaamkcpbgdpmkcpbgdpmkcpbgdpmkcpbgdp
egaobaaaabaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaamaaaaaaaceaaaaa
bedpegdpbedpegdpbedpegdpbedpegdpegaobaaaabaaaaaadcaaaaampcaabaaa
abaaaaaaegaobaaaanaaaaaaaceaaaaabedpegdpbedpegdpbedpegdpbedpegdp
egaobaaaabaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaaaoaaaaaaaceaaaaa
bedpegdpbedpegdpbedpegdpbedpegdpegaobaaaabaaaaaadcaaaaampcaabaaa
abaaaaaaegaobaaaalaaaaaaaceaaaaabedpegdpbedpegdpbedpegdpbedpegdp
egaobaaaabaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaabaaaaaaaaceaaaaa
aockaedpaockaedpaockaedpaockaedpegaobaaaabaaaaaadcaaaaampcaabaaa
abaaaaaaegaobaaaapaaaaaaaceaaaaaaockaedpaockaedpaockaedpaockaedp
egaobaaaabaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaabcaaaaaaaceaaaaa
aockaedpaockaedpaockaedpaockaedpegaobaaaabaaaaaadcaaaaampcaabaaa
abaaaaaaegaobaaabbaaaaaaaceaaaaaaockaedpaockaedpaockaedpaockaedp
egaobaaaabaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaabeaaaaaaaceaaaaa
pdhecodppdhecodppdhecodppdhecodpegaobaaaabaaaaaadcaaaaampcaabaaa
abaaaaaaegaobaaabfaaaaaaaceaaaaapdhecodppdhecodppdhecodppdhecodp
egaobaaaabaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaabgaaaaaaaceaaaaa
pdhecodppdhecodppdhecodppdhecodpegaobaaaabaaaaaadcaaaaampcaabaaa
abaaaaaaegaobaaabdaaaaaaaceaaaaapdhecodppdhecodppdhecodppdhecodp
egaobaaaabaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaabhaaaaaaaceaaaaa
opjloidoopjloidoopjloidoopjloidoegaobaaaabaaaaaadcaaaaampcaabaaa
abaaaaaaegaobaaaadaaaaaaaceaaaaaopjloidoopjloidoopjloidoopjloido
egaobaaaabaaaaaadcaaaaampcaabaaaabaaaaaaegaobaaabiaaaaaaaceaaaaa
opjloidoopjloidoopjloidoopjloidoegaobaaaabaaaaaadcaaaaampcaabaaa
abaaaaaaegaobaaaafaaaaaaaceaaaaaopjloidoopjloidoopjloidoopjloido
egaobaaaabaaaaaadiaaaaakpcaabaaaabaaaaaaegaobaaaabaaaaaaaceaaaaa
hccajcdnhccajcdnhccajcdnhccajcdndcaaaaajbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaaamaabeaaaaaaaaaiadpdiaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadkbabaaaacaaaaaadiaaaaahocaabaaaaaaaaaaaagaabaaa
aaaaaaaaagajbaaaabaaaaaadeaaaaahhcaabaaabjaaaaaajgahbaaaaaaaaaaa
egacbaaabjaaaaaadcaaaaajpccabaaaaaaaaaaaegaobaaaabaaaaaaagaabaaa
aaaaaaaaegaobaaabjaaaaaadoaaaaab"
}




}
 }
}
}