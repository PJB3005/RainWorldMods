// Compiled shader for all platforms, uncompressed size: 56.5KB

Shader "Futile/Cloud" {
Properties {
 _MainTex ("Base (RGB) Trans (A)", 2D) = "white" {}
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }


 // Stats for Vertex shader:
 //       d3d11 : 7 math
 //        d3d9 : 9 math
 //        gles : 158 math, 9 texture, 5 branch
 //       gles3 : 158 math, 9 texture, 5 branch
 //   glesdesktop : 158 math, 9 texture, 5 branch
 //       metal : 5 math
 //      opengl : 9 math
 // Stats for Fragment shader:
 //       d3d11 : 118 math, 9 texture, 4 branch
 //        d3d9 : 228 math, 9 texture, 2 branch
 //       metal : 158 math, 9 texture, 5 branch
 //      opengl : 200 math, 9 texture
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
// Stats: 118 math, 9 textures, 4 branches
SetTexture 0 [_LevelTex] 2D 2
SetTexture 1 [_GrabTexture] 2D 0
SetTexture 2 [_NoiseTex] 2D 3
SetTexture 3 [_MainTex] 2D 1
SetTexture 4 [_CloudsTex] 2D 4
SetTexture 5 [_PalTex] 2D 5
ConstBuffer "$Globals" 112
Vector 32 [_AboveCloudsAtmosphereColor]
Float 48 [_RAIN]
Vector 64 [_spriteRect]
Vector 80 [_screenSize] 2
BindCB  "$Globals" 0
"ps_4_0
eefiecedpnlmopiiiemekdimocikgfkmjpmcaibdabaaaaaaaabdaaaaadaaaaaa
cmaaaaaaliaaaaaaomaaaaaaejfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapahaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklklfdeieefcambcaaaaeaaaaaaaidaeaaaafjaaaaae
egiocaaaaaaaaaaaagaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaad
aagabaaaaeaaaaaafkaaaaadaagabaaaafaaaaaafibiaaaeaahabaaaaaaaaaaa
ffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaa
ffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaa
ffffaaaafibiaaaeaahabaaaafaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaa
gcbaaaadmcbabaaaabaaaaaagcbaaaadhcbabaaaacaaaaaagfaaaaadpccabaaa
aaaaaaaagiaaaaacahaaaaaadiaaaaaidcaabaaaaaaaaaaaogbkbaaaabaaaaaa
egiacaaaaaaaaaaaafaaaaaaebaaaaafdcaabaaaaaaaaaaaegaabaaaaaaaaaaa
aoaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaaafaaaaaa
aaaaaaajdcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaiaebaaaaaaaaaaaaaa
aeaaaaaaaaaaaaakmcaabaaaaaaaaaaaagiecaiaebaaaaaaaaaaaaaaaeaaaaaa
kgiocaaaaaaaaaaaaeaaaaaaaoaaaaahdcaabaaaaaaaaaaaegaabaaaaaaaaaaa
ogakbaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaaeghobaaa
aaaaaaaaaagabaaaacaaaaaadjaaaaakhcaabaaaaaaaaaaaegacbaaaaaaaaaaa
aceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaabaaaaahbcaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakaabaaaaaaaaaaaabaaaaahbcaabaaaaaaaaaaackaabaaa
aaaaaaaaakaabaaaaaaaaaaaaaaaaaalocaabaaaaaaaaaaafgbobaiaebaaaaaa
abaaaaaaaceaaaaaaaaaaaaanammmmdnaaaaaadpaaaaaaaadcaaaaappcaabaaa
abaaaaaaogbobaaaabaaaaaaaceaaaaaaaaaiadpaaaaialpaaaaialpaaaaaalp
aceaaaaaaaaaaaaaaaaaiadpaaaaaadpaaaaaaaaefaaaaajpcaabaaaacaaaaaa
egaabaaaabaaaaaaeghobaaaabaaaaaaaagabaaaaaaaaaaaaaaaaaahbcaabaaa
abaaaaaaakbabaaaabaaaaaabkbabaaaacaaaaaadiaaaaalhcaabaaaadaaaaaa
agiacaaaaaaaaaaaadaaaaaaaceaaaaamnmmmmdmcjfmipdnlmhejddmaaaaaaaa
aaaaaaaiccaabaaaabaaaaaaakbabaiaebaaaaaaacaaaaaaabeaaaaaaaaaiadp
dcaaaaakbcaabaaaabaaaaaaakaabaiaebaaaaaaadaaaaaabkaabaaaabaaaaaa
akaabaaaabaaaaaaddaaaaahccaabaaaabaaaaaabkbabaaaabaaaaaaabeaaaaa
kehahndpdiaaaaakhcaabaaaaeaaaaaaagaabaaaabaaaaaaaceaaaaaaaaamadp
aaaakaeaaaaaaaebaaaaaaaadcaaaaajicaabaaaaeaaaaaabkaabaaaabaaaaaa
abeaaaaaaaaaeadpbkbabaaaacaaaaaaefaaaaajpcaabaaaafaaaaaamgaabaaa
aeaaaaaaeghobaaaacaaaaaaaagabaaaadaaaaaadcaaaaajicaabaaaacaaaaaa
akaabaaaafaaaaaaabeaaaaaaaaaaaeabkaabaaaadaaaaaadiaaaaahicaabaaa
acaaaaaadkaabaaaacaaaaaaabeaaaaamdpfmieaenaaaaagicaabaaaacaaaaaa
aanaaaaadkaabaaaacaaaaaadcaaaaakbcaabaaaafaaaaaadkaabaiaebaaaaaa
acaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaaadpdgaaaaaigcaabaaaafaaaaaa
aceaaaaaaaaaaaaamnmmmmdmmnmmemdnaaaaaaaadiaaaaahkcaabaaaadaaaaaa
kgaobaaaaaaaaaaaagaebaaaafaaaaaadcaaaaajkcaabaaaadaaaaaafganbaaa
adaaaaaakgacbaaaafaaaaaaagaebaaaabaaaaaadcaaaaajicaabaaaacaaaaaa
akaabaaaafaaaaaaabeaaaaaaaaaaaeaabeaaaaaaaaaialpdiaaaaahccaabaaa
agaaaaaadkaabaaaacaaaaaaabeaaaaaaknhcddmdgaaaaafbcaabaaaagaaaaaa
abeaaaaaaaaaaaaaaaaaaaahkcaabaaaadaaaaaafganbaaaadaaaaaaagaebaaa
agaaaaaaefaaaaajpcaabaaaagaaaaaangafbaaaadaaaaaaeghobaaaadaaaaaa
aagabaaaabaaaaaadcaaaaakicaabaaaacaaaaaaakaabaiaebaaaaaaafaaaaaa
abeaaaaamnmmmmdnakaabaaaagaaaaaaaaaaaaahicaabaaaacaaaaaadkaabaaa
acaaaaaaabeaaaaajkjjbjlodeaaaaahicaabaaaacaaaaaadkaabaaaacaaaaaa
abeaaaaaaaaaaaaadiaaaaahccaabaaaadaaaaaaakaabaaaafaaaaaaakaabaaa
afaaaaaadcaaaaajccaabaaaadaaaaaabkaabaaaadaaaaaaabeaaaaajjjjbjdo
abeaaaaamnmmemdocpaaaaaficaabaaaacaaaaaadkaabaaaacaaaaaadiaaaaah
icaabaaaacaaaaaadkaabaaaacaaaaaabkaabaaaadaaaaaabjaaaaaficaabaaa
acaaaaaadkaabaaaacaaaaaadiaaaaakhcaabaaaafaaaaaajgahbaaaaaaaaaaa
aceaaaaaaaaahaebaaaaaadpaaaaiadoaaaaaaaadeaaaaahccaabaaaaaaaaaaa
akaabaaaafaaaaaaabeaaaaaaaaaaaaaaaaaaaahccaabaaaaaaaaaaabkaabaaa
aaaaaaaadkaabaaaacaaaaaaddaaaaahbcaabaaaagaaaaaabkaabaaaaaaaaaaa
abeaaaaaaaaaiadpaoaaaaakccaabaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadp
aaaaiadpaaaaiadpckbabaaaacaaaaaadiaaaaahdcaabaaaaeaaaaaafgafbaaa
aaaaaaaajgafbaaaaeaaaaaadcaaaaammcaabaaaaeaaaaaafgafbaaaabaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaamadpaaaacaeaagaibaaaadaaaaaadgaaaaai
gcaabaaaagaaaaaaaceaaaaaaaaaaaaakoehgbdnkoehobdnaaaaaaaadiaaaaah
dcaabaaaadaaaaaaogakbaaaaaaaaaaaegaabaaaagaaaaaadcaaaaajdcaabaaa
adaaaaaaegaabaaaadaaaaaacgakbaaaagaaaaaaigaabaaaaeaaaaaaefaaaaaj
pcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaaaeaaaaaaaagabaaaaeaaaaaa
diaaaaahccaabaaaaaaaaaaaakbabaaaacaaaaaaabeaaaaamdpfeieaenaaaaah
ccaabaaaaaaaaaaaaanaaaaabkaabaiaebaaaaaaaaaaaaaaaaaaaaahccaabaaa
aaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaaaeadcaaaaajicaabaaaacaaaaaa
akaabaaaadaaaaaaabeaaaaamnmmmmdnabeaaaaamnmmmmdndiaaaaahmcaabaaa
abaaaaaakgaobaaaabaaaaaapgapbaaaacaaaaaadiaaaaahmcaabaaaabaaaaaa
agaabaaaagaaaaaakgaobaaaabaaaaaadcaaaaajmcaabaaaabaaaaaafganbaaa
aeaaaaaafgafbaaaaaaaaaaakgaobaaaabaaaaaaefaaaaajpcaabaaaaeaaaaaa
ogakbaaaabaaaaaaeghobaaaaeaaaaaaaagabaaaaeaaaaaadbaaaaahccaabaaa
aaaaaaaaabeaaaaaaaaaaadpakaabaaaaeaaaaaaapaaaaahecaabaaaabaaaaaa
agaabaaaaeaaaaaaagaabaaaadaaaaaaaaaaaaaiicaabaaaabaaaaaaakaabaia
ebaaaaaaadaaaaaaabeaaaaaaaaaiadpaaaaaaahicaabaaaabaaaaaadkaabaaa
abaaaaaadkaabaaaabaaaaaaaaaaaaaiicaabaaaacaaaaaaakaabaiaebaaaaaa
aeaaaaaaabeaaaaaaaaaiadpdcaaaaakicaabaaaabaaaaaadkaabaiaebaaaaaa
abaaaaaadkaabaaaacaaaaaaabeaaaaaaaaaiadpdhaaaaajccaabaaaaaaaaaaa
bkaabaaaaaaaaaaackaabaaaabaaaaaadkaabaaaabaaaaaadbaaaaahecaabaaa
abaaaaaaabeaaaaaaaaaaadpbkaabaaaaaaaaaaaaaaaaaahicaabaaaabaaaaaa
akaabaaaagaaaaaaakaabaaaagaaaaaadiaaaaahicaabaaaabaaaaaabkaabaaa
aaaaaaaadkaabaaaabaaaaaaaaaaaaaiicaabaaaacaaaaaaakaabaiaebaaaaaa
agaaaaaaabeaaaaaaaaaiadpaaaaaaahicaabaaaacaaaaaadkaabaaaacaaaaaa
dkaabaaaacaaaaaaaaaaaaaibcaabaaaadaaaaaabkaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaiadpdcaaaaakicaabaaaacaaaaaadkaabaiaebaaaaaaacaaaaaa
akaabaaaadaaaaaaabeaaaaaaaaaiadpdhaaaaajbcaabaaaaeaaaaaackaabaaa
abaaaaaadkaabaaaabaaaaaadkaabaaaacaaaaaadgaaaaaigcaabaaaaeaaaaaa
aceaaaaaaaaaaaaajkjjjjdnjkjjbjdoaaaaaaaadiaaaaahmcaabaaaaaaaaaaa
kgaobaaaaaaaaaaaagaebaaaaeaaaaaadcaaaaajmcaabaaaaaaaaaaakgaobaaa
aaaaaaaakgacbaaaaeaaaaaaagaebaaaabaaaaaaefaaaaajpcaabaaaagaaaaaa
ogakbaaaaaaaaaaaeghobaaaadaaaaaaaagabaaaabaaaaaadcaaaaajmcaabaaa
aaaaaaaafgajbaaaafaaaaaaagaabaaaaeaaaaaaagaebaaaabaaaaaadiaaaaak
mcaabaaaaaaaaaaakgaobaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaeaea
aaaamadpefaaaaajpcaabaaaabaaaaaaogakbaaaaaaaaaaaeghobaaaacaaaaaa
aagabaaaadaaaaaabpaaaeadakaabaaaaaaaaaaadgaaaaaipccabaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadoaaaaabbfaaaaabdbaaaaah
bcaabaaaaaaaaaaaabeaaaaaibiaiadlakaabaaaacaaaaaadjaaaaakmcaabaaa
aaaaaaaafgajbaaaacaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
dmaaaaahbcaabaaaaaaaaaaackaabaaaaaaaaaaaakaabaaaaaaaaaaadmaaaaah
bcaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaaaaaaaaaabpaaaeadakaabaaa
aaaaaaaadgaaaaaipccabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaadoaaaaabbfaaaaabaaaaaaaibcaabaaaaaaaaaaabkbabaiaebaaaaaa
abaaaaaaabeaaaaaaaaaiadpaaaaaaahecaabaaaaaaaaaaaakaabaaaabaaaaaa
akaabaaaabaaaaaadcaaaaakecaabaaaaaaaaaaaakiacaaaaaaaaaaaadaaaaaa
abeaaaaaaknhcddlckaabaaaaaaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaa
aaaaaaaaabeaaaaamdpfmieaenaaaaagecaabaaaaaaaaaaaaanaaaaackaabaaa
aaaaaaaadcaaaaajecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaaadp
abeaaaaaaaaaaadpdcaaaaaphcaabaaaabaaaaaakgakbaaaaaaaaaaaaceaaaaa
ddddddlpjkjjjjloaaaaeamaaaaaaaaaaceaaaaaddddlddpmnmmemdpaaaakaea
aaaaaaaacpaaaaaficaabaaaaaaaaaaabkaabaaaagaaaaaadiaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaakaabaaaabaaaaaabjaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaaaaaaaaahbcaabaaaabaaaaaaakaabaaaaeaaaaaaabeaaaaa
jkjjjjlodiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaamaea
deaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaaadpddaaaaah
bcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaahicaabaaa
abaaaaaadkaabaaaaaaaaaaaakaabaaaabaaaaaadbaaaaahbcaabaaaacaaaaaa
abeaaaaaaaaaaadpdkaabaaaabaaaaaaaaaaaaahicaabaaaabaaaaaadkaabaaa
abaaaaaadkaabaaaabaaaaaadiaaaaahicaabaaaabaaaaaabkaabaaaaaaaaaaa
dkaabaaaabaaaaaadcaaaaakicaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaa
akaabaaaabaaaaaaabeaaaaaaaaaiadpapaaaaahicaabaaaaaaaaaaaagaabaaa
adaaaaaapgapbaaaaaaaaaaaaaaaaaaiicaabaaaaaaaaaaadkaabaiaebaaaaaa
aaaaaaaaabeaaaaaaaaaiadpdhaaaaajicaabaaaaaaaaaaaakaabaaaacaaaaaa
dkaabaaaabaaaaaadkaabaaaaaaaaaaadicaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaddddlddpaaaaaaaibcaabaaaaaaaaaaaakaabaaaaaaaaaaa
bkaabaiaebaaaaaaabaaaaaadicaaaahbcaabaaaaaaaaaaackaabaaaabaaaaaa
akaabaaaaaaaaaaaaaaaaaaibcaabaaaabaaaaaadkaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaaadpdcaaaaajbcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaa
abaaaaaadkaabaaaaaaaaaaaefaaaaampcaabaaaabaaaaaaaceaaaaaaaaaiadm
aaaahadpaaaaaaaaaaaaaaaaeghobaaaafaaaaaaaagabaaaafaaaaaadiaaaaah
icaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaiaeaeaaaaaaficaabaaa
aaaaaaaadkaabaaaaaaaaaaadcaaaaajicaabaaaaaaaaaaadkaabaaaaaaaaaaa
abeaaaaajkjjjjloabeaaaaamnmmmmdpcpaaaaafhcaabaaaabaaaaaaegacbaaa
abaaaaaadiaaaaahhcaabaaaabaaaaaapgapbaaaaaaaaaaaegacbaaaabaaaaaa
bjaaaaafhcaabaaaabaaaaaaegacbaaaabaaaaaaaaaaaaajhcaabaaaacaaaaaa
egacbaiaebaaaaaaabaaaaaaegiccaaaaaaaaaaaacaaaaaadcaaaaajhccabaaa
aaaaaaaaagbabaaaacaaaaaaegacbaaaacaaaaaaegacbaaaabaaaaaadcaaaaaj
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaaaadaaaaaabkaabaaaaaaaaaaa
dcaaaaajccaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaadeddjdlpabeaaaaa
jkjjjjdpcpaaaaaficaabaaaaaaaaaaaakaabaaaaeaaaaaadiaaaaahccaabaaa
aaaaaaaadkaabaaaaaaaaaaabkaabaaaaaaaaaaabjaaaaafccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaaaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaaaaaaaaa
abeaaaaaaaaaiadpdiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
mnmmemdodcaaaaakbcaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaakadp
akaabaiaebaaaaaaaaaaaaaadcaaaaajbcaabaaaaaaaaaaackaabaaaaaaaaaaa
abeaaaaamnmmemdnakaabaaaaaaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaeaeaeaaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
diaaaaahiccabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaklkkkkdodoaaaaab
"
}




}
 }
}
}