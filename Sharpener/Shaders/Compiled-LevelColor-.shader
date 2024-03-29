// Compiled shader for all platforms, uncompressed size: 81.9KB

Shader "Futile/LevelColor" {
Properties {
 _MainTex ("Base (RGB) Trans (A)", 2D) = "white" {}
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 GrabPass {
 }


 // Stats for Vertex shader:
 //       d3d11 : 7 math
 //        d3d9 : 8 math
 //        gles : 268 math, 18 texture, 22 branch
 //       gles3 : 268 math, 18 texture, 22 branch
 //   glesdesktop : 268 math, 18 texture, 22 branch
 //       metal : 5 math
 //      opengl : 8 math
 // Stats for Fragment shader:
 //       d3d11 : 155 math, 18 texture, 9 branch
 //        d3d9 : 282 math, 18 texture, 8 branch
 //       metal : 268 math, 18 texture, 22 branch
 //      opengl : 297 math, 17 texture
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
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 112
Vector 96 [_MainTex_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefiecedccfobnimcemenocbhimeolkbclfkkchaabaaaaaakiacaaaaadaaaaaa
cmaaaaaakaaaaaaabaabaaaaejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaafjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahaaaaaagaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apadaaaafaepfdejfeejepeoaaeoepfcenebemaafeeffiedepepfceeaaklklkl
epfdeheogiaaaaaaadaaaaaaaiaaaaaafaaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaafmaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
fmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaamadaaaafdfgfpfaepfdejfe
ejepeoaafeeffiedepepfceeaaklklklfdeieefcjaabaaaaeaaaabaageaaaaaa
fjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaaabaaaaaaaeaaaaaa
fpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaacaaaaaaghaaaaaepccabaaa
aaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagfaaaaadmccabaaaabaaaaaa
giaaaaacabaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaa
abaaaaaaabaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaaaaaaaaa
agbabaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaa
abaaaaaaacaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaa
aaaaaaaaegiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaa
dgaaaaafpccabaaaaaaaaaaaegaobaaaaaaaaaaadiaaaaakhcaabaaaaaaaaaaa
egadbaaaaaaaaaaaaceaaaaaaaaaaadpaaaaaadpaaaaaadpaaaaaaaaaaaaaaah
dccabaaaabaaaaaakgakbaaaaaaaaaaaegaabaaaaaaaaaaadcaaaaalmccabaaa
abaaaaaaagbebaaaacaaaaaaagiecaaaaaaaaaaaagaaaaaakgiocaaaaaaaaaaa
agaaaaaadoaaaaab"
}




}
Program "fp" {


SubProgram "d3d11 " {
// Stats: 155 math, 18 textures, 9 branches
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_NoiseTex] 2D 3
SetTexture 2 [_PalTex] 2D 2
SetTexture 3 [_GrabTexture] 2D 0
ConstBuffer "$Globals" 112
Float 20 [_RAIN]
Float 24 [_light]
Vector 32 [_spriteRect]
Vector 48 [_lightDirAndPixelSize]
Float 64 [_fogAmount]
Float 68 [_waterLevel]
Float 72 [_Grime]
Float 76 [_SwarmRoom]
Vector 80 [_screenSize] 2
Float 88 [_WetTerrain]
Float 92 [_cloudsSpeed]
BindCB  "$Globals" 0
"ps_4_0
eefiecednnmnmknocooplfihphibpgfhpanpmfmpabaaaaaahmblaaaaadaaaaaa
cmaaaaaajmaaaaaanaaaaaaaejfdeheogiaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaafmaaaaaaabaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaafmaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amaaaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklepfdeheo
cmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaa
apaaaaaafdfgfpfegbhcghgfheaaklklfdeieefckebkaaaaeaaaaaaakjagaaaa
fjaaaaaeegiocaaaaaaaaaaaagaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaad
aagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaa
fibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaa
fibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaa
gcbaaaaddcbabaaaabaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaacaoaaaaaa
diaaaaaidcaabaaaaaaaaaaaegbabaaaabaaaaaaegiacaaaaaaaaaaaafaaaaaa
ebaaaaafdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaoaaaaaidcaabaaaaaaaaaaa
egaabaaaaaaaaaaaegiacaaaaaaaaaaaafaaaaaaaaaaaaajdcaabaaaaaaaaaaa
egaabaaaaaaaaaaaegiacaiaebaaaaaaaaaaaaaaacaaaaaaaaaaaaakmcaabaaa
aaaaaaaaagiecaiaebaaaaaaaaaaaaaaacaaaaaakgiocaaaaaaaaaaaacaaaaaa
aoaaaaahdcaabaaaaaaaaaaaegaabaaaaaaaaaaaogakbaaaaaaaaaaaefaaaaaj
pcaabaaaabaaaaaaegaabaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaa
diaaaaahicaabaaaaaaaaaaaakaabaaaabaaaaaaabeaaaaafgffdfeabnaaaaai
bcaabaaaabaaaaaadkaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaabkaaaaag
icaabaaaaaaaaaaadkaabaiaibaaaaaaaaaaaaaadhaaaaakicaabaaaaaaaaaaa
akaabaaaabaaaaaadkaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaadcaaaaaj
icaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaleecabeaaaaaaaaaialp
diaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaijiiaidnbnaaaaai
bcaabaaaabaaaaaadkaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaabkaaaaag
icaabaaaaaaaaaaadkaabaiaibaaaaaaaaaaaaaadhaaaaakicaabaaaaaaaaaaa
akaabaaaabaaaaaadkaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaadiaaaaak
dcaabaaaabaaaaaaegaabaaaaaaaaaaaaceaaaaaaaaamadpaaaaiadoaaaaaaaa
aaaaaaaadcaaaaandcaabaaaabaaaaaapgapbaiaebaaaaaaaaaaaaaaaceaaaaa
mnmmmmdnmnmmmmdnaaaaaaaaaaaaaaaaegaabaaaabaaaaaadiaaaaaiicaabaaa
aaaaaaaabkiacaaaaaaaaaaaabaaaaaaabeaaaaamnmmmmdndcaaaaandcaabaaa
abaaaaaafgifcaaaaaaaaaaaabaaaaaaaceaaaaaaknhcddmmnmmemdnaaaaaaaa
aaaaaaaaegaabaaaabaaaaaaefaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaa
eghobaaaabaaaaaaaagabaaaadaaaaaaaaaaaaahbcaabaaaabaaaaaaakaabaaa
aaaaaaaaakaabaaaabaaaaaaaaaaaaahbcaabaaaabaaaaaabkaabaaaaaaaaaaa
akaabaaaabaaaaaadcaaaaakbcaabaaaabaaaaaabkiacaaaaaaaaaaaabaaaaaa
abeaaaaamnmmmmdnakaabaaaabaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaa
abaaaaaaabeaaaaafclibgebenaaaaagbcaabaaaabaaaaaaaanaaaaaakaabaaa
abaaaaaaaaaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaddddhdlp
dicaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaakaebdbaaaaai
ccaabaaaabaaaaaackiacaaaaaaaaaaaafaaaaaaabeaaaaaaaaaaadpaaaaaaai
ecaabaaaabaaaaaabkbabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadpdbaaaaai
icaabaaaabaaaaaabkiacaaaaaaaaaaaaeaaaaaackaabaaaabaaaaaadmaaaaah
ccaabaaaabaaaaaadkaabaaaabaaaaaabkaabaaaabaaaaaadiaaaaahbcaabaaa
abaaaaaaakaabaaaabaaaaaaabeaaaaagpbciddkdhaaaaajbcaabaaaabaaaaaa
bkaabaaaabaaaaaaabeaaaaaaaaaaaaaakaabaaaabaaaaaaaaaaaaahecaabaaa
aaaaaaaabkaabaaaaaaaaaaaakaabaaaabaaaaaaefaaaaajpcaabaaaacaaaaaa
igaabaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaabiaaaaaklcaabaaa
abaaaaaaegaibaaaacaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaaaaaaaaaiadp
abaaaaahecaabaaaaaaaaaaabkaabaaaabaaaaaaakaabaaaabaaaaaaabaaaaah
ecaabaaaaaaaaaaadkaabaaaabaaaaaackaabaaaaaaaaaaadiaaaaakdcaabaaa
abaaaaaaegaabaaaacaaaaaaaceaaaaaaaaahpedaaaahpedaaaaaaaaaaaaaaaa
blaaaaafdcaabaaaadaaaaaaegaabaaaabaaaaaacbaaaaahccaabaaaabaaaaaa
bkaabaaaadaaaaaaabeaaaaabaaaaaaaboaaaaakdcaabaaaaeaaaaaabgafbaaa
adaaaaaaaceaaaaapappppppkgppppppaaaaaaaaaaaaaaaadgaaaaafecaabaaa
aeaaaaaaabeaaaaaaaaaaaaadgaaaaafecaabaaaadaaaaaaabeaaaaaaaaaiadp
dhaaaaajdcaabaaaacaaaaaafgafbaaaabaaaaaaigaabaaaaeaaaaaajgafbaaa
adaaaaaacbaaaaahicaabaaaabaaaaaaakaabaaaacaaaaaaabeaaaaaaiaaaaaa
boaaaaahbcaabaaaafaaaaaaakaabaaaacaaaaaaabeaaaaapippppppdgaaaaai
kcaabaaaafaaaaaaaceaaaaaaaaaaaaageaaaaaaaaaaaaaaaaaafadpdhaaaaaj
jcaabaaaacaaaaaapgapbaaaabaaaaaaagaebaaaafaaaaaaagaabaaaacaaaaaa
diaaaaaiicaabaaaabaaaaaadkaabaaaaaaaaaaadkiacaaaaaaaaaaaafaaaaaa
dcaaaaajicaabaaaabaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadpdkaabaaa
abaaaaaaedaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaadiaaaaahbcaabaaa
abaaaaaaakaabaaaabaaaaaaabeaaaaaijiiaidnbnaaaaaiccaabaaaadaaaaaa
akaabaaaabaaaaaaakaabaiaebaaaaaaabaaaaaabkaaaaagbcaabaaaabaaaaaa
akaabaiaibaaaaaaabaaaaaadhaaaaakbcaabaaaabaaaaaabkaabaaaadaaaaaa
akaabaaaabaaaaaaakaabaiaebaaaaaaabaaaaaadcaaaaakbcaabaaaafaaaaaa
akaabaiaebaaaaaaabaaaaaaabeaaaaaomfblidndkaabaaaabaaaaaadcaaaaak
icaabaaaabaaaaaabkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaaadpabeaaaaa
aaaaiadpdiaaaaajccaabaaaadaaaaaabkiacaaaaaaaaaaaabaaaaaadkiacaaa
aaaaaaaaafaaaaaadcaaaaajicaabaaaabaaaaaabkaabaaaadaaaaaaabeaaaaa
mnmmemdodkaabaaaabaaaaaadcaaaaakccaabaaaafaaaaaaakaabaiaebaaaaaa
abaaaaaaabeaaaaaomfblidndkaabaaaabaaaaaaefaaaaajpcaabaaaagaaaaaa
egaabaaaafaaaaaaeghobaaaabaaaaaaaagabaaaadaaaaaadcaaaaakicaabaaa
aaaaaaaadkaabaaaaaaaaaaadkiacaaaaaaaaaaaafaaaaaaakaabaaaagaaaaaa
aaaaaaaiicaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaadkaabaaaaaaaaaaa
bnaaaaaibcaabaaaabaaaaaadkaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaa
bkaaaaagicaabaaaaaaaaaaadkaabaiaibaaaaaaaaaaaaaadhaaaaakicaabaaa
aaaaaaaaakaabaaaabaaaaaadkaabaaaaaaaaaaadkaabaiaebaaaaaaaaaaaaaa
diaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaamdpfmieaenaaaaag
icaabaaaaaaaaaaaaanaaaaadkaabaaaaaaaaaaadcaaaaajicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaaaaaaeaeaabeaaaaaaaaaaadpdccaaaalicaabaaa
aeaaaaaackiacaiaebaaaaaaaaaaaaaaabaaaaaaabeaaaaaaaaaiaeadkaabaaa
aaaaaaaaccaaaaahicaabaaaaaaaaaaaabeaaaaafkaaaaaaakaabaaaadaaaaaa
dhaaaaajjcaabaaaabaaaaaapgapbaaaaaaaaaaapgahbaaaaeaaaaaakgacbaaa
adaaaaaaboaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaaabeaaaaapppppppp
claaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaahicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaaijiiaidnebaaaaaficaabaaaabaaaaaadkaabaaa
aaaaaaaadeaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaaa
ddaaaaahicaabaaaabaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaaaeablaaaaaf
bcaabaaaadaaaaaadkaabaaaabaaaaaabnaaaaaiccaabaaaadaaaaaadkaabaaa
aaaaaaaadkaabaiaebaaaaaaaaaaaaaabkaaaaagicaabaaaaaaaaaaadkaabaia
ibaaaaaaaaaaaaaadhaaaaakicaabaaaaaaaaaaabkaabaaaadaaaaaadkaabaaa
aaaaaaaadkaabaiaebaaaaaaaaaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaapaebblaaaaafccaabaaaadaaaaaadkaabaaaaaaaaaaa
edaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaakmcaabaaaadaaaaaa
kgiocaaaaaaaaaaaadaaaaaaagiecaiaebaaaaaaaaaaaaaaadaaaaaaboaaaaah
bcaabaaaaeaaaaaabkaabaaaadaaaaaaabeaaaaaplppppppclaaaaafbcaabaaa
aeaaaaaaakaabaaaaeaaaaaadcaaaaajbcaabaaaafaaaaaackaabaaaadaaaaaa
akaabaaaaeaaaaaaakbabaaaabaaaaaadcaaaaajccaabaaaafaaaaaadkaabaaa
adaaaaaaakaabaaaaeaaaaaackaabaaaabaaaaaaaaaaaaakmcaabaaaadaaaaaa
agaebaaaafaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaalpjkjjjjloaaaaaaah
ecaabaaaabaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaakamadcaaaaajecaabaaa
abaaaaaackaabaaaabaaaaaaabeaaaaadfhiaodlabeaaaaaaaaaiadpdcaaaaam
mcaabaaaadaaaaaakgaobaaaadaaaaaakgakbaaaabaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaadpjkjjjjdoefaaaaajpcaabaaaaeaaaaaaogakbaaaadaaaaaa
eghobaaaadaaaaaaaagabaaaaaaaaaaadiaaaaahecaabaaaabaaaaaabkaabaaa
acaaaaaadkaabaaaaaaaaaaadiaaaaahbcaabaaaagaaaaaackaabaaaabaaaaaa
abeaaaaaaaaaaadnboaaaaahecaabaaaabaaaaaaakaabaaaadaaaaaaabeaaaaa
adaaaaaaclaaaaafecaabaaaabaaaaaackaabaaaabaaaaaaaaaaaaahecaabaaa
abaaaaaackaabaaaabaaaaaaabeaaaaaaaaaaadpdiaaaaahccaabaaaagaaaaaa
ckaabaaaabaaaaaaabeaaaaaaaaaaadoefaaaaajpcaabaaaahaaaaaaegaabaaa
agaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaaaaaaaaahecaabaaaabaaaaaa
dkaabaaaabaaaaaaabeaaaaaaaaaaadpdiaaaaahecaabaaaagaaaaaackaabaaa
abaaaaaaabeaaaaaaaaaaadoefaaaaajpcaabaaaagaaaaaaigaabaaaagaaaaaa
eghobaaaacaaaaaaaagabaaaacaaaaaaaaaaaaahdcaabaaaaaaaaaaaegaabaaa
aaaaaaaaegaabaaaaaaaaaaaefaaaaajpcaabaaaaiaaaaaaegaabaaaaaaaaaaa
eghobaaaabaaaaaaaagabaaaadaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaa
aiaaaaaaabeaaaaaaaaaiaeabkiacaaaaaaaaaaaabaaaaaadcaaaaajbcaabaaa
aaaaaaaadkaabaaaaaaaaaaaabeaaaaaklkkkkdnakaabaaaaaaaaaaadiaaaaah
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaamdpfmieaenaaaaagbcaabaaa
aaaaaaaaaanaaaaaakaabaaaaaaaaaaadcaaaaajbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaaadpdcaaaaajbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaaaaaamiebabeaaaaaaaaalaeadiaaaaahecaabaaa
afaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadnefaaaaajpcaabaaaafaaaaaa
ogakbaaaafaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaadcaaaaakbcaabaaa
aaaaaaaackaabaiaebaaaaaaacaaaaaaabeaaaaaaaaahpedabeaaaaaaaiahped
diaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaohdodldkdgaaaaaf
ccaabaaaaaaaaaaaabeaaaaaaknhhpdpefaaaaajpcaabaaaaiaaaaaaegaabaaa
aaaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaacjaaaaahbcaabaaaaaaaaaaa
dkaabaaaacaaaaaaabeaaaaaabaaaaaaboaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaapoppppppclaaaaafbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
aaaaaaaldcaabaaaaaaaaaaaagaabaiaebaaaaaaaaaaaaaaaceaaaaaaaaalaea
aaaajaeaaaaaaaaaaaaaaaaadiaaaaakdcaabaaaajaaaaaaegaabaaaaaaaaaaa
aceaaaaaaaaaaadoaaaaaadoaaaaaaaaaaaaaaaadgaaaaaimcaabaaaajaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaahedpaaaahmdpefaaaaajpcaabaaaakaaaaaa
cgakbaaaajaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaaefaaaaajpcaabaaa
alaaaaaadgapbaaaajaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaaefaaaaaj
pcaabaaaamaaaaaaggakbaaaajaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaa
efaaaaajpcaabaaaajaaaaaahgapbaaaajaaaaaaeghobaaaacaaaaaaaagabaaa
acaaaaaabpaaaeadckaabaaaaaaaaaaaefaaaaampcaabaaaanaaaaaaaceaaaaa
aaaaiadmaaaahadpaaaaaaaaaaaaaaaadghjbaaaacaaaaaaaagabaaaacaaaaaa
dgaaaaafhccabaaaaaaaaaaajgahbaaaanaaaaaadgaaaaafbcaabaaaaaaaaaaa
abeaaaaappppppppbcaaaaabdjaaaaahccaabaaaaaaaaaaaakaabaaaabaaaaaa
abeaaaaaaaaaiadpcbaaaaahbcaabaaaaaaaaaaabkaabaaaadaaaaaaabeaaaaa
afaaaaaaabaaaaahccaabaaaaaaaaaaaakaabaaaaaaaaaaabkaabaaaaaaaaaaa
bpaaaeadbkaabaaaaaaaaaaadjaaaaakhcaabaaaaeaaaaaaegacbaaaaeaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadmaaaaahccaabaaaaaaaaaaa
bkaabaaaaeaaaaaaakaabaaaaeaaaaaadmaaaaahccaabaaaaaaaaaaackaabaaa
aeaaaaaabkaabaaaaaaaaaaadhaaaaajbcaabaaaabaaaaaabkaabaaaaaaaaaaa
abeaaaaaaaaaiadpakaabaaaabaaaaaabfaaaaabaaaaaaaipcaabaaaaeaaaaaa
egaobaiaebaaaaaaahaaaaaaegaobaaaagaaaaaadcaaaaajpcaabaaaaeaaaaaa
agaabaaaabaaaaaaegaobaaaaeaaaaaaegaobaaaahaaaaaacbaaaaahccaabaaa
aaaaaaaaakaabaaaacaaaaaaabeaaaaaaeaaaaaaabaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaabeaaaaamnmmemdodiaaaaaiccaabaaaaaaaaaaabkaabaaa
aaaaaaaackiacaaaaaaaaaaaaeaaaaaaaaaaaaaipcaabaaaafaaaaaaegaobaia
ebaaaaaaaeaaaaaaegaobaaaafaaaaaadcaaaaajpcaabaaaaeaaaaaafgafbaaa
aaaaaaaaegaobaaaafaaaaaaegaobaaaaeaaaaaacaaaaaahccaabaaaaaaaaaaa
dkaabaaaacaaaaaaabeaaaaageaaaaaabpaaaeadbkaabaaaaaaaaaaacaaaaaah
ccaabaaaaaaaaaaaakaabaaaadaaaaaaabeaaaaaacaaaaaadcaaaaakecaabaaa
aaaaaaaaakaabaiaebaaaaaaabaaaaaaabeaaaaamnmmmmdnabeaaaaamnmmemdo
aaaaaaalpcaabaaaafaaaaaaegaobaiaebaaaaaaaiaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaiadpdcaaaaajpcaabaaaafaaaaaakgakbaaaaaaaaaaa
egaobaaaafaaaaaaegaobaaaaiaaaaaadhaaaaajpcaabaaaafaaaaaafgafbaaa
aaaaaaaaegaobaaaafaaaaaaegaobaaaaiaaaaaaefaaaaampcaabaaaagaaaaaa
aceaaaaaaaaaeadnaaaahadpaaaaaaaaaaaaaaaaeghobaaaacaaaaaaaagabaaa
acaaaaaadiaaaaahccaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaijiiiidm
aaaaaaaipcaabaaaagaaaaaaegaobaiaebaaaaaaafaaaaaaegaobaaaagaaaaaa
dcaaaaajpcaabaaaafaaaaaafgafbaaaaaaaaaaaegaobaaaagaaaaaaegaobaaa
afaaaaaaaaaaaaaipcaabaaaagaaaaaaegaobaiaebaaaaaaaeaaaaaaegaobaaa
afaaaaaadcaaaaampcaabaaaagaaaaaaegaobaaaagaaaaaaaceaaaaadddddddp
dddddddpdddddddpdddddddpegaobaaaaeaaaaaadiaaaaahpcaabaaaafaaaaaa
egaobaaaaeaaaaaaegaobaaaafaaaaaaaaaaaaahccaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaaaaaagamadicaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
abeaaaaajkjjjjdodcaaaaajecaabaaaaaaaaaaaakaabaaaabaaaaaaabeaaaaa
mnmmmmdoabeaaaaajjjjbjlpdcaaaaajccaabaaaaaaaaaaabkaabaaaaaaaaaaa
ckaabaaaaaaaaaaaabeaaaaaggggggdpdcaaaaanpcaabaaaafaaaaaaegaobaaa
afaaaaaaaceaaaaaaaaamadpaaaamadpaaaamadpaaaamadpegaobaiaebaaaaaa
agaaaaaadcaaaaajpcaabaaaafaaaaaafgafbaaaaaaaaaaaegaobaaaafaaaaaa
egaobaaaagaaaaaabcaaaaabccaaaaahccaabaaaaaaaaaaaabeaaaaaaaaaaaaa
akaabaaaacaaaaaaccaaaaahecaabaaaaaaaaaaaakaabaaaacaaaaaaabeaaaaa
adaaaaaaabaaaaahccaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaaaaaaaaaa
bpaaaeadbkaabaaaaaaaaaaaaaaaaaaipcaabaaaagaaaaaaegaobaiaebaaaaaa
akaaaaaaegaobaaaalaaaaaadcaaaaajpcaabaaaagaaaaaaagaabaaaabaaaaaa
egaobaaaagaaaaaaegaobaaaakaaaaaaaaaaaaaipcaabaaaahaaaaaaegaobaia
ebaaaaaaamaaaaaaegaobaaaajaaaaaadcaaaaajpcaabaaaahaaaaaaagaabaaa
abaaaaaaegaobaaaahaaaaaaegaobaaaamaaaaaadiaaaaahccaabaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaaijiiaidnaaaaaaaipcaabaaaahaaaaaaegaobaia
ebaaaaaaagaaaaaaegaobaaaahaaaaaadcaaaaajpcaabaaaagaaaaaafgafbaaa
aaaaaaaaegaobaaaahaaaaaaegaobaaaagaaaaaaaaaaaaaipcaabaaaagaaaaaa
egaobaiaebaaaaaaaeaaaaaaegaobaaaagaaaaaadcaaaaajpcaabaaaafaaaaaa
kgakbaaaacaaaaaaegaobaaaagaaaaaaegaobaaaaeaaaaaabcaaaaabcaaaaaah
ccaabaaaaaaaaaaaakaabaaaacaaaaaaabeaaaaaadaaaaaadiaaaaaiecaabaaa
aaaaaaaackaabaaaacaaaaaadkiacaaaaaaaaaaaaeaaaaaaaaaaaaalpcaabaaa
agaaaaaaegaobaiaebaaaaaaaeaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaiadpdcaaaaajpcaabaaaagaaaaaakgakbaaaaaaaaaaaegaobaaaagaaaaaa
egaobaaaaeaaaaaadhaaaaajpcaabaaaafaaaaaafgafbaaaaaaaaaaaegaobaaa
agaaaaaaegaobaaaaeaaaaaabfaaaaabbfaaaaabefaaaaampcaabaaaaeaaaaaa
aceaaaaaaaaaeadnaaaahadpaaaaaaaaaaaaaaaaeghobaaaacaaaaaaaagabaaa
acaaaaaaccaaaaahccaabaaaaaaaaaaabkaabaaaadaaaaaaabeaaaaaakaaaaaa
abaaaaahecaabaaaaaaaaaaabkaabaaaabaaaaaaabeaaaaaaaaaaadpaaaaaaah
ecaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaaacaaaaaadhaaaaajccaabaaa
aaaaaaaabkaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaadkaabaaaaaaaaaaadiaaaaaiccaabaaa
aaaaaaaabkaabaaaaaaaaaaaakiacaaaaaaaaaaaaeaaaaaadicaaaahccaabaaa
aaaaaaaabkaabaaaaaaaaaaaabeaaaaaijiiaidnaaaaaaaipcaabaaaabaaaaaa
egaobaiaebaaaaaaafaaaaaaegaobaaaaeaaaaaadcaaaaajpcaabaaaanaaaaaa
fgafbaaaaaaaaaaadgajbaaaabaaaaaadgajbaaaafaaaaaadgaaaaafhccabaaa
aaaaaaaajgahbaaaanaaaaaabfaaaaabdcaaaaapgcaabaaaaaaaaaaaagbbbaaa
abaaaaaaaceaaaaaaaaaaaaaaaaaiadpaaaaialpaaaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaiadpaaaaaaaaefaaaaajpcaabaaaabaaaaaajgafbaaaaaaaaaaa
eghobaaaadaaaaaaaagabaaaaaaaaaaabpaaaeadakaabaaaaaaaaaaadbaaaaah
bcaabaaaaaaaaaaaabeaaaaaibiaiadlakaabaaaabaaaaaadjaaaaakgcaabaaa
aaaaaaaafgagbaaaabaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
dmaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaadmaaaaah
bcaabaaaaaaaaaaackaabaaaaaaaaaaaakaabaaaaaaaaaaadhaaaaajiccabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaaaaakaabaaaanaaaaaabcaaaaab
dgaaaaaficcabaaaaaaaaaaaakaabaaaanaaaaaabfaaaaabdoaaaaab"
}




}
 }
}
}