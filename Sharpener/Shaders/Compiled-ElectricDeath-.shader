// Compiled shader for all platforms, uncompressed size: 58.3KB

Shader "Futile/ElectricDeath" {
Properties {
 _MainTex ("Base (RGB) Trans (A)", 2D) = "white" {}
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }


 // Stats for Vertex shader:
 //       d3d11 : 7 math
 //        d3d9 : 9 math
 //        gles : 171 math, 9 texture, 7 branch
 //       gles3 : 171 math, 9 texture, 7 branch
 //   glesdesktop : 171 math, 9 texture, 7 branch
 //       metal : 5 math
 //      opengl : 9 math
 // Stats for Fragment shader:
 //       d3d11 : 103 math, 9 texture, 10 branch
 //        d3d9 : 232 math, 9 texture, 4 branch
 //       metal : 171 math, 9 texture, 7 branch
 //      opengl : 183 math, 9 texture
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
// Stats: 103 math, 9 textures, 10 branches
SetTexture 0 [_LevelTex] 2D 1
SetTexture 1 [_GrabTexture] 2D 0
SetTexture 2 [_NoiseTex2] 2D 3
SetTexture 3 [_NoiseTex] 2D 2
ConstBuffer "$Globals" 80
Float 16 [_RAIN]
Vector 32 [_spriteRect]
Vector 48 [_screenSize] 2
BindCB  "$Globals" 0
"ps_4_0
eefiecedcgnohlhhgnalhobdjjoacodpjfpbkigcabaaaaaapebbaaaaadaaaaaa
cmaaaaaaliaaaaaaomaaaaaaejfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadaaaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapamaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklklfdeieefcaabbaaaaeaaaaaaaeaaeaaaafjaaaaae
egiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafibiaaae
aahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaaabaaaaaaffffaaaafibiaaae
aahabaaaacaaaaaaffffaaaafibiaaaeaahabaaaadaaaaaaffffaaaagcbaaaad
mcbabaaaabaaaaaagcbaaaadmcbabaaaacaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacajaaaaaadiaaaaaihcaabaaaaaaaaaaaogblbaaaabaaaaaaegibcaaa
aaaaaaaaadaaaaaaebaaaaafhcaabaaaaaaaaaaaegacbaaaaaaaaaaaaoaaaaai
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegibcaaaaaaaaaaaadaaaaaaaaaaaaaj
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaegibcaiaebaaaaaaaaaaaaaaacaaaaaa
aaaaaaakhcaabaaaabaaaaaaegibcaiaebaaaaaaaaaaaaaaacaaaaaaogilcaaa
aaaaaaaaacaaaaaaaoaaaaahhcaabaaaaaaaaaaaegacbaaaaaaaaaaaegacbaaa
abaaaaaaefaaaaajpcaabaaaabaaaaaaigaabaaaaaaaaaaaeghobaaaaaaaaaaa
aagabaaaabaaaaaabiaaaaakocaabaaaabaaaaaaagajbaaaabaaaaaaaceaaaaa
aaaaaaaaaaaaiadpaaaaiadpaaaaiadpabaaaaahicaabaaaaaaaaaaackaabaaa
abaaaaaabkaabaaaabaaaaaaabaaaaahicaabaaaaaaaaaaadkaabaaaabaaaaaa
dkaabaaaaaaaaaaadcaaaaajbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaa
aaaahpedabeaaaaaaaaaialpdiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaa
abeaaaaaijiiaidnbnaaaaaiccaabaaaabaaaaaaakaabaaaabaaaaaaakaabaia
ebaaaaaaabaaaaaabkaaaaagbcaabaaaabaaaaaaakaabaiaibaaaaaaabaaaaaa
dhaaaaakbcaabaaaabaaaaaabkaabaaaabaaaaaaakaabaaaabaaaaaaakaabaia
ebaaaaaaabaaaaaadcaaaaapgcaabaaaabaaaaaakgblbaaaabaaaaaaaceaaaaa
aaaaaaaaaaaaiadpaaaaialpaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaiadp
aaaaaaaaefaaaaajpcaabaaaacaaaaaajgafbaaaabaaaaaaeghobaaaabaaaaaa
aagabaaaaaaaaaaaaaaaaaakocaabaaaabaaaaaaagakbaaaaaaaaaaaaceaaaaa
aaaaaaaaaaaaaalpaaaaaalpaaaaaalpdiaaaaakocaabaaaabaaaaaafgaobaaa
abaaaaaaaceaaaaaaaaaaaaamnmmmmdomnmmmmdomnmmmmdodcaaaaajhcaabaaa
aaaaaaaajgahbaaaabaaaaaaagaabaaaabaaaaaaegacbaaaaaaaaaaadiaaaaah
bcaabaaaadaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaaadpdiaaaaalocaabaaa
abaaaaaaagiacaaaaaaaaaaaabaaaaaaaceaaaaaaaaaaaaahbdnpiecaknhcddm
kgjleedmdcaaaaajecaabaaaadaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaiado
bkaabaaaabaaaaaaefaaaaajpcaabaaaadaaaaaaigaabaaaadaaaaaaeghobaaa
acaaaaaaaagabaaaadaaaaaaaaaaaaakhcaabaaaadaaaaaaegabbaaaadaaaaaa
aceaaaaaaaaaaalpaaaaaalpaaaaaalpaaaaaaaadcaaaaamhcaabaaaaaaaaaaa
egacbaaaadaaaaaaaceaaaaaaknhcddmaknhcddmaknhcddmaaaaaaaaegacbaaa
aaaaaaaadcaaaaajbcaabaaaadaaaaaaakaabaaaabaaaaaaabeaaaaakpehgbdn
ckaabaaaabaaaaaadiaaaaaiccaabaaaadaaaaaaakiacaaaaaaaaaaaabaaaaaa
abeaaaaacjfmipdnefaaaaajpcaabaaaadaaaaaaegaabaaaadaaaaaaeghobaaa
acaaaaaaaagabaaaadaaaaaadcaaaaakbcaabaaaaeaaaaaaakaabaaaaaaaaaaa
abeaaaaamnmmmmdndkaabaiaebaaaaaaabaaaaaadiaaaaalpcaabaaaafaaaaaa
agiacaaaaaaaaaaaabaaaaaaaceaaaaaaknhkddoanhbcmdndffolkdnjcfmhodn
dcaaaaamocaabaaaaeaaaaaakgaibaaaaaaaaaaaaceaaaaaaaaaaaaajkjjbjdo
mnmmemdpjkjjbjdpagajbaaaafaaaaaaefaaaaajpcaabaaaagaaaaaaegaabaaa
aeaaaaaaeghobaaaadaaaaaaaagabaaaacaaaaaadcaaaaajccaabaaaabaaaaaa
ckaabaaaaaaaaaaaabeaaaaajkjjbjdoabeaaaaaaaaaaadpdcaaaaakccaabaaa
aeaaaaaaakiacaaaaaaaaaaaabaaaaaaabeaaaaaaknhkddobkaabaaaabaaaaaa
efaaaaajpcaabaaaahaaaaaaegaabaaaaeaaaaaaeghobaaaadaaaaaaaagabaaa
acaaaaaaefaaaaajpcaabaaaaeaaaaaaogakbaaaaeaaaaaaeghobaaaadaaaaaa
aagabaaaacaaaaaadcaaaaajccaabaaaafaaaaaaakaabaaaaaaaaaaaabeaaaaa
jkjjjjdpdkaabaaaafaaaaaadiaaaaalocaabaaaabaaaaaaagiacaaaaaaaaaaa
abaaaaaaaceaaaaaaaaaaaaaaknhcddobedpegdmdffodkdodcaaaaammcaabaaa
afaaaaaafgajbaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaamnmmemdpjkjjjjdp
fganbaaaabaaaaaaefaaaaajpcaabaaaaiaaaaaajgafbaaaafaaaaaaeghobaaa
adaaaaaaaagabaaaacaaaaaadcaaaaakbcaabaaaafaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaaaeackaabaiaebaaaaaaabaaaaaaefaaaaajpcaabaaaafaaaaaa
mgaabaaaafaaaaaaeghobaaaadaaaaaaaagabaaaacaaaaaabpaaaeaddkaabaaa
aaaaaaaadgaaaaaipccabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaadoaaaaabbfaaaaabdbaaaaahbcaabaaaaaaaaaaaakaabaaaabaaaaaa
abeaaaaaijiiaidnbpaaaeadakaabaaaaaaaaaaadgaaaaaipccabaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadoaaaaabbfaaaaabdbaaaaah
bcaabaaaaaaaaaaaabeaaaaaklkkckdoakaabaaaabaaaaaabpaaaeadakaabaaa
aaaaaaaadjaaaaakhcaabaaaaaaaaaaaegacbaaaacaaaaaaaceaaaaaaaaaaaaa
aaaaaaaaaaaaaaaaaaaaaaaadmaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaa
akaabaaaaaaaaaaadmaaaaahbcaabaaaaaaaaaaackaabaaaaaaaaaaaakaabaaa
aaaaaaaabpaaaeadakaabaaaaaaaaaaadgaaaaaipccabaaaaaaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadoaaaaabbfaaaaabbfaaaaabdiaaaaah
bcaabaaaaaaaaaaaakaabaaaagaaaaaaabeaaaaamdpfeieadiaaaaahccaabaaa
aaaaaaaaakaabaaaadaaaaaaabeaaaaamnmmmmdndcaaaaapocaabaaaabaaaaaa
agaabaaaadaaaaaaaceaaaaaaaaaaaaaaaaaeaeageggoglpaaaaeamaaceaaaaa
aaaaaaaaaaaaiaeaggggogeaaaaaeaeaaaaaaaahecaabaaaaaaaaaaaakaabaaa
adaaaaaaakaabaaaadaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
bkaabaaaabaaaaaackaabaiaebaaaaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaa
akiacaaaaaaaaaaaabaaaaaaabeaaaaafmipbcebakaabaaaaaaaaaaaenaaaaag
bcaabaaaaaaaaaaaaanaaaaaakaabaaaaaaaaaaadcaaaaakbcaabaaaaaaaaaaa
akaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaaadpdiaaaaah
ecaabaaaaaaaaaaaakaabaaaahaaaaaaabeaaaaamdpfeieadcaaaaajicaabaaa
aaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaaeamaabeaaaaaaaaaoaeadcaaaaaj
ccaabaaaaaaaaaaackaabaaaaaaaaaaadkaabaaaaaaaaaaabkaabaaaaaaaaaaa
dcaaaaakccaabaaaaaaaaaaaakiacaaaaaaaaaaaabaaaaaaabeaaaaafmipbceb
bkaabaaaaaaaaaaaenaaaaagccaabaaaaaaaaaaaaanaaaaabkaabaaaaaaaaaaa
dcaaaaapgcaabaaaaaaaaaaafgafbaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaadp
aaaaaadpaaaaaaaaaceaaaaaaaaaaaaaaaaaaadpaaaaiadpaaaaaaaaddaaaaah
ecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaiadpdiaaaaahbcaabaaa
aaaaaaaackaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahecaabaaaaaaaaaaa
akaabaaaaeaaaaaaabeaaaaamdpfeieadiaaaaahicaabaaaaaaaaaaaakaabaaa
aaaaaaaaakaabaaaadaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaaaaaaaaaa
abeaaaaaaaaaiaeadcaaaaajecaabaaaaaaaaaaackaabaaaaaaaaaaackaabaaa
abaaaaaadkaabaaaaaaaaaaadcaaaaakecaabaaaaaaaaaaaakiacaaaaaaaaaaa
abaaaaaaabeaaaaajkjjgjebckaabaaaaaaaaaaadcaaaaajecaabaaaaaaaaaaa
akaabaaaabaaaaaaabeaaaaamommemdockaabaaaaaaaaaaaenaaaaagecaabaaa
aaaaaaaaaanaaaaackaabaaaaaaaaaaadiaaaaahicaabaaaaaaaaaaaakaabaaa
aiaaaaaaabeaaaaamdpfeieadcaaaabagcaabaaaabaaaaaakgakbaiaebaaaaaa
aaaaaaaaaceaaaaaaaaaaaaaaaaaaadpaaaaaadpaaaaaaaaaceaaaaaaaaaaaaa
aaaaaadpaaaalaeaaaaaaaaadiaaaaahecaabaaaaaaaaaaadkaabaaaabaaaaaa
akaabaaaaaaaaaaadcaaaaakecaabaaaaaaaaaaadkaabaaaaaaaaaaackaabaaa
abaaaaaackaabaiaebaaaaaaaaaaaaaadcaaaaakecaabaaaaaaaaaaaakiacaaa
aaaaaaaaabaaaaaaabeaaaaajkjjdjebckaabaaaaaaaaaaaaaaaaaaiecaabaaa
aaaaaaaaakaabaiaebaaaaaaabaaaaaackaabaaaaaaaaaaaenaaaaagecaabaaa
aaaaaaaaaanaaaaackaabaaaaaaaaaaadcaaaaajecaabaaaaaaaaaaackaabaaa
aaaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaaadpdiaaaaahicaabaaaaaaaaaaa
akaabaaaafaaaaaaabeaaaaamdpfeieaaaaaaaaiecaabaaaabaaaaaackaabaia
ebaaaaaaaaaaaaaaabeaaaaaaaaamaeadiaaaaahicaabaaaabaaaaaackbabaaa
acaaaaaaabeaaaaakehaaneadcaaaaajicaabaaaaaaaaaaadkaabaaaaaaaaaaa
ckaabaaaabaaaaaadkaabaaaabaaaaaadcaaaaakicaabaaaaaaaaaaaakiacaaa
aaaaaaaaabaaaaaaabeaaaaajkjjajebdkaabaaaaaaaaaaadcaaaaajicaabaaa
aaaaaaaaakaabaaaabaaaaaaabeaaaaadeddhddpdkaabaaaaaaaaaaaenaaaaag
icaabaaaaaaaaaaaaanaaaaadkaabaaaaaaaaaaadcaaaaajicaabaaaaaaaaaaa
dkaabaaaaaaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaaadpdiaaaaahecaabaaa
abaaaaaaakaabaaaaaaaaaaadkbabaaaacaaaaaadcaaaaajicaabaaaabaaaaaa
ckaabaaaabaaaaaaabeaaaaaaamanbdiabeaaaaahcpjhpdpdiaaaaahbcaabaaa
acaaaaaaakaabaaaaaaaaaaaakaabaaaaaaaaaaadcaaaaakccaabaaaaaaaaaaa
bkaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaiaebaaaaaaacaaaaaadcaaaaaj
ccaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaacaaaaaa
diaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaadkbabaaaacaaaaaadeaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaabkaabaaaabaaaaaadcaaaaapdcaabaaa
acaaaaaapgbpbaaaacaaaaaaaceaaaaaaamanbdijkjjbjlpaaaaaaaaaaaaaaaa
aceaaaaahcpjhpdpmnmmemdpaaaaaaaaaaaaaaaaaaaaaaaiccaabaaaaaaaaaaa
bkaabaiaebaaaaaaaaaaaaaaabeaaaaaaaaaiadpdcaaaaakecaabaaaaaaaaaaa
ckaabaiaebaaaaaaaaaaaaaaakaabaaaacaaaaaaabeaaaaaaaaaiadpdiaaaaah
ccaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaaaaaaaaaadcaaaaakecaabaaa
aaaaaaaadkaabaiaebaaaaaaaaaaaaaadkaabaaaabaaaaaaabeaaaaaaaaaiadp
dcaaaaakccaabaaaaaaaaaaabkaabaiaebaaaaaaaaaaaaaackaabaaaaaaaaaaa
abeaaaaaaaaaiadpdiaaaaahecaabaaaaaaaaaaackaabaaaabaaaaaadkbabaaa
acaaaaaadcaaaaajecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaakaimmi
abeaaaaaaahmjceicpaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaackaabaaaaaaaaaaabjaaaaafccaabaaa
aaaaaaaabkaabaaaaaaaaaaacpaaaaafecaabaaaaaaaaaaaakaabaaaaaaaaaaa
diaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaabkaabaaaacaaaaaabjaaaaaf
ecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaahccaabaaaaaaaaaaackaabaaa
aaaaaaaabkaabaaaaaaaaaaadbaaaaahccaabaaaaaaaaaaaabeaaaaaaaaaaadp
bkaabaaaaaaaaaaabpaaaeadbkaabaaaaaaaaaaaaaaaaaaiccaabaaaaaaaaaaa
akaabaiaebaaaaaaabaaaaaaabeaaaaaaaaaiadpdiaaaaahccaabaaaaaaaaaaa
bkaabaaaaaaaaaaaabeaaaaajkjjbjdpdiaaaaahiccabaaaaaaaaaaabkaabaaa
aaaaaaaadkbabaaaacaaaaaadgaaaaaihccabaaaaaaaaaaaaceaaaaaaaaaaaaa
aaaaiadpaaaaaaaaaaaaaaaadoaaaaabbcaaaaabdgaaaaafbccabaaaaaaaaaaa
akaabaaaaaaaaaaadgaaaaaioccabaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaaaaa
aaaaaaaaaaaaaaaadoaaaaabbfaaaaabdoaaaaab"
}




}
 }
}
}