// Compiled shader for all platforms, uncompressed size: 48.9KB

Shader "Futile/WaterSplash" {
Properties {
 _MainTex ("Base (RGB) Trans (A)", 2D) = "white" {}
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }


 // Stats for Vertex shader:
 //       d3d11 : 7 math
 //        d3d9 : 9 math
 //        gles : 133 math, 9 texture, 9 branch
 //       gles3 : 133 math, 9 texture, 9 branch
 //   glesdesktop : 133 math, 9 texture, 9 branch
 //       metal : 5 math
 //      opengl : 9 math
 // Stats for Fragment shader:
 //       d3d11 : 104 math, 9 texture, 5 branch
 //        d3d9 : 192 math, 9 texture, 4 branch
 //       metal : 133 math, 9 texture, 9 branch
 //      opengl : 167 math, 8 texture
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
// Stats: 104 math, 9 textures, 5 branches
SetTexture 0 [_NoiseTex] 2D 2
SetTexture 1 [_LevelTex] 2D 1
SetTexture 2 [_GrabTexture] 2D 0
SetTexture 3 [_PalTex] 2D 3
ConstBuffer "$Globals" 80
Float 16 [_RAIN]
Vector 32 [_spriteRect]
Vector 48 [_screenSize] 2
Float 56 [_waterLevel]
BindCB  "$Globals" 0
"ps_4_0
eefiecedjlbbohaeemadhpiabmdeoppopmliipohabaaaaaagebbaaaaadaaaaaa
cmaaaaaaliaaaaaaomaaaaaaejfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapapaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklklfdeieefchabaaaaaeaaaaaaabmaeaaaafjaaaaae
egiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaagcbaaaad
dcbabaaaabaaaaaagcbaaaadmcbabaaaabaaaaaagcbaaaadpcbabaaaacaaaaaa
gfaaaaadpccabaaaaaaaaaaagiaaaaacafaaaaaadiaaaaaidcaabaaaaaaaaaaa
ogbkbaaaabaaaaaaegiacaaaaaaaaaaaadaaaaaaebaaaaafdcaabaaaaaaaaaaa
egaabaaaaaaaaaaaaoaaaaaidcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaaa
aaaaaaaaadaaaaaaaaaaaaajdcaabaaaaaaaaaaaegaabaaaaaaaaaaaegiacaia
ebaaaaaaaaaaaaaaacaaaaaaaaaaaaakmcaabaaaaaaaaaaaagiecaiaebaaaaaa
aaaaaaaaacaaaaaakgiocaaaaaaaaaaaacaaaaaaaoaaaaahdcaabaaaaaaaaaaa
egaabaaaaaaaaaaaogakbaaaaaaaaaaaaaaaaaakmcaabaaaaaaaaaaaagbebaaa
abaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaalpaaaaaalpapaaaaahicaabaaa
aaaaaaaaogakbaaaaaaaaaaaogakbaaaaaaaaaaaelaaaaaficaabaaaaaaaaaaa
dkaabaaaaaaaaaaaaaaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaa
aaaaaaaaddaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadp
aaaaaaajecaabaaaaaaaaaaackaabaiaibaaaaaaaaaaaaaackaabaiaibaaaaaa
aaaaaaaadcaaaaakbcaabaaaabaaaaaadkbabaiaebaaaaaaacaaaaaaabeaaaaa
mnmmmmdoabeaaaaadddddddpcpaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaa
diaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaaakaabaaaabaaaaaabjaaaaaf
ecaabaaaaaaaaaaackaabaaaaaaaaaaaaaaaaaaiecaabaaaaaaaaaaadkaabaia
ebaaaaaaaaaaaaaackaabaaaaaaaaaaadcaaaaajecaabaaaaaaaaaaabkbabaaa
acaaaaaackaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaakdcaabaaaabaaaaaa
egaabaaaaaaaaaaaaceaaaaajkjjjjdpjkjjjjdpaaaaaaaaaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaa
dcaaaaakicaabaaaaaaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaeaeaakiacaaa
aaaaaaaaabaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaa
mdpfmieaenaaaaagicaabaaaaaaaaaaaaanaaaaadkaabaaaaaaaaaaadcaaaaaj
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaaadp
dcaaaaajicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaagpbciddlabeaaaaa
gpbcadllaaaaaaaibcaabaaaabaaaaaackaabaiaebaaaaaaaaaaaaaaabeaaaaa
aaaaiadpdiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaaabaaaaaa
diaaaaaidcaabaaaabaaaaaapgapbaaaaaaaaaaaegiacaaaaaaaaaaaadaaaaaa
ebaaaaafdcaabaaaabaaaaaaegaabaaaabaaaaaaaoaaaaaidcaabaaaabaaaaaa
egaabaaaabaaaaaaegiacaaaaaaaaaaaadaaaaaaaaaaaaahdcaabaaaaaaaaaaa
egaabaaaaaaaaaaaegaabaaaabaaaaaadiaaaaaiicaabaaaaaaaaaaaakiacaaa
aaaaaaaaabaaaaaaabeaaaaaaaaajeebdiaaaaakdcaabaaaacaaaaaaegaabaaa
aaaaaaaaaceaaaaajkjjjbebddddedebaaaaaaaaaaaaaaaadcaaaaakecaabaaa
acaaaaaaakiacaaaaaaaaaaaabaaaaaaabeaaaaajkjjbjeabkaabaaaacaaaaaa
efaaaaajpcaabaaaacaaaaaaigaabaaaacaaaaaaeghobaaaaaaaaaaaaagabaaa
acaaaaaadcaaaaajicaabaaaaaaaaaaaakaabaaaacaaaaaaabeaaaaaaaaaeaea
dkaabaaaaaaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaa
mdpfeieaenaaaaagicaabaaaaaaaaaaaaanaaaaadkaabaaaaaaaaaaadcaaaaaj
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaaadp
diaaaaaiecaabaaaabaaaaaaakbabaaaacaaaaaaakiacaaaaaaaaaaaabaaaaaa
dcaaaaanmcaabaaaabaaaaaakgakbaiaebaaaaaaabaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaliebaaaaliebagbebaaaabaaaaaaefaaaaajpcaabaaaacaaaaaa
ogakbaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaacaaaaaadiaaaaahecaabaaa
abaaaaaadkaabaaaaaaaaaaaakaabaaaacaaaaaaaaaaaaaiicaabaaaabaaaaaa
ckbabaiaebaaaaaaacaaaaaaabeaaaaaaaaaiadpdiaaaaahicaabaaaabaaaaaa
dkaabaaaabaaaaaadkbabaaaacaaaaaadcaaaaakicaabaaaaaaaaaaadkaabaia
ebaaaaaaaaaaaaaaakaabaaaacaaaaaaabeaaaaaaaaaiadpdcaaaaajicaabaaa
aaaaaaaadkaabaaaabaaaaaadkaabaaaaaaaaaaackaabaaaabaaaaaaaaaaaaai
ecaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaadkaabaaaaaaaaaaadeaaaaah
ecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaaaaaaaaaaaahmcaabaaa
abaaaaaaagaebaaaabaaaaaaagaebaaaaaaaaaaaefaaaaajpcaabaaaacaaaaaa
ogakbaaaabaaaaaaeghobaaaabaaaaaaaagabaaaabaaaaaadcaaaaapmcaabaaa
abaaaaaakgbobaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaiadpaaaaialp
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaiadpaaaaaaahdcaabaaaabaaaaaa
egaabaaaabaaaaaaogakbaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaa
abaaaaaaeghobaaaacaaaaaaaagabaaaaaaaaaaadcaaaaajicaabaaaaaaaaaaa
akaabaaaacaaaaaaabeaaaaaaaaahpedabeaaaaaaaaaialpdiaaaaahicaabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaaijiiaidnbnaaaaaiicaabaaaacaaaaaa
dkaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaabkaaaaagicaabaaaaaaaaaaa
dkaabaiaibaaaaaaaaaaaaaadhaaaaakicaabaaaaaaaaaaadkaabaaaacaaaaaa
dkaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaabiaaaaakhcaabaaaacaaaaaa
egacbaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaaaaaabaaaaah
bcaabaaaacaaaaaabkaabaaaacaaaaaaakaabaaaacaaaaaaabaaaaahbcaabaaa
acaaaaaackaabaaaacaaaaaaakaabaaaacaaaaaadhaaaaajicaabaaaaaaaaaaa
akaabaaaacaaaaaaabeaaaaaaaaaiadpdkaabaaaaaaaaaaadbaaaaahbcaabaaa
acaaaaaaabeaaaaamnmmemdodkaabaaaaaaaaaaabpaaaeadakaabaaaacaaaaaa
biaaaaakhcaabaaaacaaaaaaegacbaaaabaaaaaaaceaaaaaaaaaaaaaibiaiadl
aaaaaaaaaaaaaaaaabaaaaahbcaabaaaacaaaaaabkaabaaaacaaaaaaakaabaaa
acaaaaaaabaaaaahbcaabaaaacaaaaaackaabaaaacaaaaaaakaabaaaacaaaaaa
bpaaaeadakaabaaaacaaaaaaefaaaaampcaabaaaabaaaaaaaceaaaaaaaaabado
aaaahadpaaaaaaaaaaaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaadgaaaaaf
icaabaaaaaaaaaaaabeaaaaaaaaaiadpbcaaaaabdbaaaaahbcaabaaaacaaaaaa
abeaaaaaibiaiadlakaabaaaabaaaaaadjaaaaakgcaabaaaacaaaaaafgagbaaa
abaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadmaaaaahbcaabaaa
acaaaaaabkaabaaaacaaaaaaakaabaaaacaaaaaadmaaaaahbcaabaaaacaaaaaa
ckaabaaaacaaaaaaakaabaaaacaaaaaadhaaaaajicaabaaaaaaaaaaaakaabaaa
acaaaaaaabeaaaaamnmmemdodkaabaaaaaaaaaaabfaaaaabbfaaaaabdiaaaaah
bcaabaaaacaaaaaackaabaaaaaaaaaaadkbabaaaacaaaaaadbaaaaahccaabaaa
acaaaaaaabeaaaaaaaaaaadpckbabaaaacaaaaaadcaaaaajecaabaaaaaaaaaaa
ckaabaaaaaaaaaaadkbabaaaacaaaaaaabeaaaaamnmmemlndhaaaaajecaabaaa
aaaaaaaabkaabaaaacaaaaaackaabaaaaaaaaaaaakaabaaaacaaaaaadcaaaaaj
bcaabaaaacaaaaaadkbabaaaacaaaaaaabeaaaaaaknhcdlnabeaaaaamnmmemdn
dbaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaaakaabaaaacaaaaaabpaaaead
ckaabaaaaaaaaaaadgaaaaaipccabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaadoaaaaabbfaaaaabaaaaaaajecaabaaaaaaaaaaackiacaia
ebaaaaaaaaaaaaaaadaaaaaaabeaaaaapgcifmdpaaaaaaaiecaabaaaaaaaaaaa
ckaabaiaebaaaaaaaaaaaaaadkbabaaaabaaaaaadicaaaahecaabaaaaaaaaaaa
ckaabaaaaaaaaaaaabeaaaaaaaaakaeaaaaaaaaiecaabaaaaaaaaaaackaabaia
ebaaaaaaaaaaaaaaabeaaaaaaaaaiadpefaaaaampcaabaaaadaaaaaaaceaaaaa
aaaadadoaaaahadpaaaaaaaaaaaaaaaaeghobaaaadaaaaaaaagabaaaadaaaaaa
efaaaaampcaabaaaaeaaaaaaaceaaaaaaaaabadoaaaahadpaaaaaaaaaaaaaaaa
eghobaaaadaaaaaaaagabaaaadaaaaaaaaaaaaaipcaabaaaaeaaaaaaegaobaia
ebaaaaaaadaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaaadaaaaaapgapbaaa
aaaaaaaaegaobaaaaeaaaaaaegaobaaaadaaaaaaefaaaaampcaabaaaaeaaaaaa
aceaaaaaaaaaiadmaaaahadpaaaaaaaaaaaaaaaaeghobaaaadaaaaaaaagabaaa
adaaaaaaaaaaaaaibcaabaaaacaaaaaadkbabaiaebaaaaaaacaaaaaaabeaaaaa
aaaaiadpdiaaaaahbcaabaaaacaaaaaaakaabaaaacaaaaaaabeaaaaaaaaaaadp
diaaaaahbcaabaaaacaaaaaadkaabaaaaaaaaaaaakaabaaaacaaaaaaaaaaaaai
ecaabaaaacaaaaaackaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaah
bcaabaaaacaaaaaackaabaaaacaaaaaaakaabaaaacaaaaaaaaaaaaaipcaabaaa
aeaaaaaaegaobaiaebaaaaaaadaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaa
adaaaaaaagaabaaaacaaaaaaegaobaaaaeaaaaaaegaobaaaadaaaaaadcaaaaak
bcaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaaaeaakaabaaa
aaaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaklkkkkdo
dcaaaaakbcaabaaaaaaaaaaaakiacaaaaaaaaaaaabaaaaaaabeaaaaaaaaamieb
akaabaaaaaaaaaaaenaaaaagbcaabaaaaaaaaaaaaanaaaaaakaabaaaaaaaaaaa
dcaaaaajbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadpabeaaaaa
aaaaaadpcpaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahbcaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaoaeabjaaaaafbcaabaaaaaaaaaaa
akaabaaaaaaaaaaadcaaaaajbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
mnmmemdoabeaaaaajkjjjjdodcaaaaajbcaabaaaaaaaaaaadkaabaaaaaaaaaaa
abeaaaaaaaaaaadpakaabaaaaaaaaaaadiaaaaahbcaabaaaaaaaaaaackaabaaa
acaaaaaaakaabaaaaaaaaaaaaaaaaaalpcaabaaaaeaaaaaaegaobaiaebaaaaaa
adaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadpaaaaiadpdcaaaaajpcaabaaa
aeaaaaaaagaabaaaaaaaaaaaegaobaaaaeaaaaaaegaobaaaadaaaaaadhaaaaaj
pcaabaaaacaaaaaafgafbaaaacaaaaaaegaobaaaaeaaaaaaegaobaaaadaaaaaa
bnaaaaahbcaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaamnmmemdodbaaaaah
ccaabaaaaaaaaaaaabeaaaaaibiaiadlakaabaaaabaaaaaadjaaaaakdcaabaaa
adaaaaaajgafbaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
dmaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaadaaaaaadmaaaaah
ccaabaaaaaaaaaaabkaabaaaadaaaaaabkaabaaaaaaaaaaaabaaaaahbcaabaaa
aaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaajccaabaaaaaaaaaaa
ckaabaaaaaaaaaaaabeaaaaaaaaaaalpabeaaaaaaaaaiadpaaaaaaaipcaabaaa
abaaaaaaegaobaaaabaaaaaaegaobaiaebaaaaaaacaaaaaadcaaaaajpcaabaaa
abaaaaaafgafbaaaaaaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaadhaaaaaj
pccabaaaaaaaaaaaagaabaaaaaaaaaaaegaobaaaabaaaaaaegaobaaaacaaaaaa
doaaaaab"
}




}
 }
}
}