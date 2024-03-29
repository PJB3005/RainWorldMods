// Compiled shader for all platforms, uncompressed size: 33.0KB

Shader "Futile/BlackGoo" {
Properties {
 _MainTex ("Base (RGB) Trans (A)", 2D) = "white" {}
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }


 // Stats for Vertex shader:
 //       d3d11 : 7 math
 //        d3d9 : 9 math
 //        gles : 60 math, 6 texture, 7 branch
 //       gles3 : 60 math, 6 texture, 7 branch
 //   glesdesktop : 60 math, 6 texture, 7 branch
 //       metal : 5 math
 //      opengl : 9 math
 // Stats for Fragment shader:
 //       d3d11 : 47 math, 6 texture, 9 branch
 //        d3d9 : 100 math, 6 texture, 2 branch
 //       metal : 60 math, 6 texture, 7 branch
 //      opengl : 102 math, 6 texture
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
// Stats: 47 math, 6 textures, 9 branches
SetTexture 0 [_LevelTex] 2D 2
SetTexture 1 [_GrabTexture] 2D 0
SetTexture 2 [_MainTex] 2D 1
SetTexture 3 [_PalTex] 2D 4
SetTexture 4 [_NoiseTex] 2D 3
ConstBuffer "$Globals" 80
Vector 32 [_spriteRect]
Vector 48 [_screenSize] 2
BindCB  "$Globals" 0
"ps_4_0
eefiecedoggfgghadhdmnmhccinihndffndcbafaabaaaaaaoaajaaaaadaaaaaa
cmaaaaaaliaaaaaaomaaaaaaejfdeheoieaaaaaaaeaaaaaaaiaaaaaagiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaheaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaaheaaaaaaabaaaaaaaaaaaaaaadaaaaaaabaaaaaa
amamaaaahnaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaaapaaaaaafdfgfpfa
epfdejfeejepeoaafeeffiedepepfceeaaedepemepfcaaklepfdeheocmaaaaaa
abaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapaaaaaa
fdfgfpfegbhcghgfheaaklklfdeieefcomaiaaaaeaaaaaaadlacaaaafjaaaaae
egiocaaaaaaaaaaaaeaaaaaafkaaaaadaagabaaaaaaaaaaafkaaaaadaagabaaa
abaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaadaagabaaaadaaaaaafkaaaaad
aagabaaaaeaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaa
adaaaaaaffffaaaafibiaaaeaahabaaaaeaaaaaaffffaaaagcbaaaaddcbabaaa
abaaaaaagcbaaaadmcbabaaaabaaaaaagfaaaaadpccabaaaaaaaaaaagiaaaaac
aeaaaaaadiaaaaaidcaabaaaaaaaaaaaogbkbaaaabaaaaaaegiacaaaaaaaaaaa
adaaaaaaebaaaaafdcaabaaaaaaaaaaaegaabaaaaaaaaaaaaoaaaaaidcaabaaa
aaaaaaaaegaabaaaaaaaaaaaegiacaaaaaaaaaaaadaaaaaaaaaaaaajdcaabaaa
aaaaaaaaegaabaaaaaaaaaaaegiacaiaebaaaaaaaaaaaaaaacaaaaaaaaaaaaak
mcaabaaaaaaaaaaaagiecaiaebaaaaaaaaaaaaaaacaaaaaakgiocaaaaaaaaaaa
acaaaaaaaoaaaaahdcaabaaaaaaaaaaaegaabaaaaaaaaaaaogakbaaaaaaaaaaa
efaaaaajpcaabaaaabaaaaaaegaabaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaa
acaaaaaadiaaaaahecaabaaaaaaaaaaaakaabaaaabaaaaaaabeaaaaaaaaahped
blaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaaabaaaaahicaabaaaaaaaaaaa
ckaabaaaaaaaaaaaabeaaaaaaaaaaaiaceaaaaaiecaabaaaaaaaaaaackaabaaa
aaaaaaaackaabaiaebaaaaaaaaaaaaaaeoaaaaaiaanaaaaaecaabaaaaaaaaaaa
ckaabaaaaaaaaaaaabeaaaaaboaaaaaaciaaaaaficaabaaaabaaaaaackaabaaa
aaaaaaaadhaaaaajecaabaaaaaaaaaaadkaabaaaaaaaaaaadkaabaaaabaaaaaa
ckaabaaaaaaaaaaaclaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadiaaaaak
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaaaebaaaaiaeaijiiaidn
aaaaaaaabiaaaaakhcaabaaaabaaaaaaegacbaaaabaaaaaaaceaaaaaaaaaiadp
aaaaiadpaaaaiadpaaaaaaaaabaaaaahicaabaaaaaaaaaaabkaabaaaabaaaaaa
akaabaaaabaaaaaaabaaaaahicaabaaaaaaaaaaackaabaaaabaaaaaadkaabaaa
aaaaaaaadhaaaaajecaabaaaaaaaaaaadkaabaaaaaaaaaaaabeaaaaaaaaaiadp
ckaabaaaaaaaaaaadbaaaaahicaabaaaaaaaaaaaabeaaaaamnmmemdockaabaaa
aaaaaaaadcaaaaapdcaabaaaabaaaaaaogbkbaaaabaaaaaaaceaaaaaaaaaiadp
aaaaialpaaaaaaaaaaaaaaaaaceaaaaaaaaaaaaaaaaaiadpaaaaaaaaaaaaaaaa
efaaaaajpcaabaaaabaaaaaaegaabaaaabaaaaaaeghobaaaabaaaaaaaagabaaa
aaaaaaaaaaaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaomfbdilo
deaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaaaaaaaaadiaaaaah
icaabaaaabaaaaaackaabaaaaaaaaaaaabeaaaaapkbijmdpaaaaaaakdcaabaaa
acaaaaaaegbabaaaabaaaaaaaceaaaaaaaaaaalpaaaaaalpaaaaaaaaaaaaaaaa
apaaaaahecaabaaaacaaaaaaegaabaaaacaaaaaaegaabaaaacaaaaaaeeaaaaaf
ecaabaaaacaaaaaackaabaaaacaaaaaadiaaaaahdcaabaaaacaaaaaakgakbaaa
acaaaaaaegaabaaaacaaaaaadiaaaaahdcaabaaaacaaaaaapgapbaaaabaaaaaa
egaabaaaacaaaaaadcaaaaamdcaabaaaacaaaaaaegaabaaaacaaaaaaaceaaaaa
ipmcpfdnipmcpfdnaaaaaaaaaaaaaaaaegbabaaaabaaaaaaefaaaaajpcaabaaa
acaaaaaaegaabaaaacaaaaaaeghobaaaacaaaaaaaagabaaaabaaaaaaefaaaaaj
pcaabaaaadaaaaaaegaabaaaaaaaaaaaeghobaaaaeaaaaaaaagabaaaadaaaaaa
bpaaaeaddkaabaaaaaaaaaaadbaaaaahbcaabaaaaaaaaaaaabeaaaaaibiaiadl
akaabaaaabaaaaaadjaaaaakkcaabaaaaaaaaaaafgajbaaaabaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadmaaaaahbcaabaaaaaaaaaaabkaabaaa
aaaaaaaaakaabaaaaaaaaaaadmaaaaahbcaabaaaaaaaaaaadkaabaaaaaaaaaaa
akaabaaaaaaaaaaabpaaaeadakaabaaaaaaaaaaadgaaaaaipccabaaaaaaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadoaaaaabbfaaaaabbfaaaaab
aaaaaaaibcaabaaaaaaaaaaaakaabaiaebaaaaaaacaaaaaaabeaaaaaaaaaiadp
dcaaaaajccaabaaaaaaaaaaaakaabaaaadaaaaaaabeaaaaajkjjbjdpabeaaaaa
mnmmmmdodiaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaa
dbaaaaahccaabaaaaaaaaaaaabeaaaaaaaaaaadpakaabaaaaaaaaaaacpaaaaaf
icaabaaaaaaaaaaaakaabaaaaaaaaaaadiaaaaahicaabaaaaaaaaaaadkaabaaa
aaaaaaaaabeaaaaadddddddpbjaaaaaficaabaaaaaaaaaaadkaabaaaaaaaaaaa
dhaaaaajbcaabaaaaaaaaaaabkaabaaaaaaaaaaadkaabaaaaaaaaaaaakaabaaa
aaaaaaaadcaaaaakbcaabaaaaaaaaaaackaabaiaebaaaaaaaaaaaaaaabeaaaaa
jambhjdoakaabaaaaaaaaaaadeaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaaaaadbaaaaahccaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
jkjjjjdobpaaaeadbkaabaaaaaaaaaaadgaaaaaipccabaaaaaaaaaaaaceaaaaa
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadoaaaaabbcaaaaabefaaaaampcaabaaa
acaaaaaaaceaaaaaaaaakadnaaaahadpaaaaaaaaaaaaaaaaeghobaaaadaaaaaa
aagabaaaaeaaaaaaefaaaaampcaabaaaadaaaaaaaceaaaaaaaaahedpaaaahadp
aaaaaaaaaaaaaaaaeghobaaaadaaaaaaaagabaaaaeaaaaaacpaaaaafccaabaaa
aaaaaaaadkaabaaaabaaaaaadiaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
abeaaaaaggggogdobjaaaaafccaabaaaaaaaaaaabkaabaaaaaaaaaaadiaaaaah
ccaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaiadodcaaaaanhcaabaaa
abaaaaaaagaabaaaadaaaaaaaceaaaaaaaaaaadpaaaaaadpdddddddpaaaaaaaa
egacbaiaebaaaaaaacaaaaaadcaaaaajocaabaaaaaaaaaaafgafbaaaaaaaaaaa
agajbaaaabaaaaaaagajbaaaacaaaaaadbaaaaahbcaabaaaaaaaaaaaabeaaaaa
jkjjbjdpakaabaaaaaaaaaaabpaaaeadakaabaaaaaaaaaaadgaaaaafhccabaaa
aaaaaaaajgahbaaaaaaaaaaadgaaaaaficcabaaaaaaaaaaaabeaaaaaaaaaiadp
doaaaaabbcaaaaabdgaaaaafhccabaaaaaaaaaaajgahbaaaaaaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaaadpdoaaaaabbfaaaaabbfaaaaabdoaaaaab
"
}




}
 }
}
}