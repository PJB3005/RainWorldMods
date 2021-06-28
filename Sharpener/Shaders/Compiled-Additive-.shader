// Compiled shader for all platforms, uncompressed size: 46.3KB

Shader "Futile/Additive" {
Properties {
 _MainTex ("Base (RGB) Trans (A)", 2D) = "white" {}
}
SubShader { 
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 GrabPass {
 }


 // Stats for Vertex shader:
 //       d3d11 : 5 math
 //        d3d9 : 5 math
 //        gles : 135 math, 10 texture, 14 branch
 //       gles3 : 135 math, 10 texture, 14 branch
 //   glesdesktop : 135 math, 10 texture, 14 branch
 //       metal : 3 math
 //      opengl : 5 math
 // Stats for Fragment shader:
 //       d3d11 : 75 math, 10 texture, 5 branch
 //        d3d9 : 159 math, 10 texture, 4 branch
 //       metal : 135 math, 10 texture, 14 branch
 //      opengl : 166 math, 10 texture
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
// Stats: 5 math
Bind "vertex" Vertex
Bind "texcoord" TexCoord0
ConstBuffer "$Globals" 96
Vector 80 [_MainTex_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefiecedgalfkkmeejbgnejmlejlkjffjjghdjkaabaaaaaacmacaaaaadaaaaaa
cmaaaaaakaaaaaaapiaaaaaaejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaafjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahaaaaaagaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apadaaaafaepfdejfeejepeoaaeoepfcenebemaafeeffiedepepfceeaaklklkl
epfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefccmabaaaa
eaaaabaaelaaaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafjaaaaaeegiocaaa
abaaaaaaaeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaacaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagiaaaaac
abaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaacaaaaaaegiacaaaaaaaaaaaafaaaaaaogikcaaa
aaaaaaaaafaaaaaadoaaaaab"
}
}
Program "fp" {
SubProgram "d3d11 " {
// Stats: 75 math, 10 textures, 5 branches
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_NoiseTex] 2D 3
SetTexture 2 [_PalTex] 2D 2
SetTexture 3 [_GrabTexture] 2D 0
ConstBuffer "$Globals" 96
Float 20 [_RAIN]
Float 24 [_light]
Vector 32 [_spriteRect]
Vector 48 [_lightDirAndPixelSize]
Float 64 [_fogAmount]
BindCB  "$Globals" 0
"ps_4_0
eefiecedndfkfjggamabjgkpcclpmmacfiiliicjabaaaaaanaaoaaaaadaaaaaa
cmaaaaaaieaaaaaaliaaaaaaejfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcbaaoaaaa
eaaaaaaaieadaaaafjaaaaaeegiocaaaaaaaaaaaafaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaa
adaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacaiaaaaaaaaaaaaakdcaabaaaaaaaaaaaegiacaiaebaaaaaaaaaaaaaa
acaaaaaaogikcaaaaaaaaaaaacaaaaaadcaaaaakgcaabaaaaaaaaaaaagbbbaaa
abaaaaaaagabbaaaaaaaaaaaagibcaaaaaaaaaaaacaaaaaaefaaaaajpcaabaaa
abaaaaaaegbabaaaabaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaabiaaaaak
hcaabaaaacaaaaaaegacbaaaabaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaaaaaabaaaaahicaabaaaabaaaaaabkaabaaaacaaaaaaakaabaaaacaaaaaa
abaaaaahicaabaaaabaaaaaackaabaaaacaaaaaadkaabaaaabaaaaaadiaaaaah
bcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaaaaahpedblaaaaafbcaabaaa
acaaaaaaakaabaaaabaaaaaadiaaaaaibcaabaaaabaaaaaabkiacaaaaaaaaaaa
abaaaaaaabeaaaaamnmmmmdndcaaaaajbcaabaaaabaaaaaaakbabaaaabaaaaaa
abeaaaaaaaaaaadpakaabaaaabaaaaaaboaaaaakdcaabaaaadaaaaaaagaabaaa
acaaaaaaaceaaaaappppppppkgppppppaaaaaaaaaaaaaaaaclaaaaafecaabaaa
acaaaaaaakaabaaaadaaaaaadiaaaaahecaabaaaacaaaaaackaabaaaacaaaaaa
abeaaaaaijiiaidnbnaaaaaiicaabaaaacaaaaaackaabaaaacaaaaaackaabaia
ebaaaaaaacaaaaaabkaaaaagecaabaaaacaaaaaackaabaiaibaaaaaaacaaaaaa
dhaaaaakecaabaaaacaaaaaadkaabaaaacaaaaaackaabaaaacaaaaaackaabaia
ebaaaaaaacaaaaaadcaaaaakbcaabaaaaeaaaaaackaabaiaebaaaaaaacaaaaaa
abeaaaaaomfblidnakaabaaaabaaaaaadcaaaaakbcaabaaaabaaaaaabkbabaia
ebaaaaaaabaaaaaaabeaaaaaaaaaaadpabeaaaaaaaaaiadpdcaaaaakbcaabaaa
abaaaaaabkiacaaaaaaaaaaaabaaaaaaabeaaaaaaaaaaadpakaabaaaabaaaaaa
dcaaaaakccaabaaaaeaaaaaackaabaiaebaaaaaaacaaaaaaabeaaaaaomfblidn
akaabaaaabaaaaaaefaaaaajpcaabaaaaeaaaaaaegaabaaaaeaaaaaaeghobaaa
abaaaaaaaagabaaaadaaaaaaaaaaaaahbcaabaaaabaaaaaaakaabaaaaeaaaaaa
abeaaaaajkjjbjlpaaaaaaajbcaabaaaabaaaaaaakaabaaaabaaaaaackiacaia
ebaaaaaaaaaaaaaaabaaaaaadicaaaahecaabaaaadaaaaaaakaabaaaabaaaaaa
abeaaaaaaaaaeaeaccaaaaahbcaabaaaabaaaaaaabeaaaaafkaaaaaaakaabaaa
acaaaaaadcaaaaakccaabaaaacaaaaaackaabaiaebaaaaaaadaaaaaaabeaaaaa
mnmmmmdnabeaaaaaaaaaiadpdhaaaaajdcaabaaaacaaaaaaagaabaaaabaaaaaa
ggakbaaaadaaaaaabgafbaaaacaaaaaaclaaaaafbcaabaaaabaaaaaabkaabaaa
acaaaaaadiaaaaahbcaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaaijiiaidn
ebaaaaafbcaabaaaabaaaaaaakaabaaaabaaaaaablaaaaafecaabaaaacaaaaaa
akaabaaaabaaaaaaboaaaaahccaabaaaacaaaaaabkaabaaaacaaaaaaabeaaaaa
ppppppppclaaaaafccaabaaaacaaaaaabkaabaaaacaaaaaadiaaaaahccaabaaa
acaaaaaabkaabaaaacaaaaaaabeaaaaaijiiaidnbnaaaaaiicaabaaaacaaaaaa
bkaabaaaacaaaaaabkaabaiaebaaaaaaacaaaaaabkaaaaagccaabaaaacaaaaaa
bkaabaiaibaaaaaaacaaaaaadhaaaaakccaabaaaacaaaaaadkaabaaaacaaaaaa
bkaabaaaacaaaaaabkaabaiaebaaaaaaacaaaaaadiaaaaahccaabaaaacaaaaaa
bkaabaaaacaaaaaaabeaaaaaaaaapaebblaaaaaficaabaaaacaaaaaabkaabaaa
acaaaaaaedaaaaafccaabaaaacaaaaaabkaabaaaacaaaaaadiaaaaakdcaabaaa
adaaaaaaogikcaaaaaaaaaaaadaaaaaaegiacaiaebaaaaaaaaaaaaaaadaaaaaa
boaaaaahecaabaaaadaaaaaadkaabaaaacaaaaaaabeaaaaaplppppppclaaaaaf
ecaabaaaadaaaaaackaabaaaadaaaaaadiaaaaahdcaabaaaadaaaaaakgakbaaa
adaaaaaaegaabaaaadaaaaaadcaaaaajbcaabaaaaeaaaaaaakaabaaaadaaaaaa
abeaaaaajkjjjjdpbkaabaaaaaaaaaaaaaaaaaaljcaabaaaaaaaaaaakgakbaia
ebaaaaaaaaaaaaaaaceaaaaaaaaaiadpaaaaaaaaaaaaaaaaaaaaiadpdcaaaaaj
ccaabaaaaeaaaaaabkaabaaaadaaaaaaabeaaaaajkjjjjdpakaabaaaaaaaaaaa
efaaaaajpcaabaaaadaaaaaaegaabaaaaeaaaaaaeghobaaaadaaaaaaaagabaaa
aaaaaaaadiaaaaahbcaabaaaaeaaaaaabkaabaaaacaaaaaaabeaaaaaaaaaaadn
boaaaaahbcaabaaaaaaaaaaackaabaaaacaaaaaaabeaaaaaadaaaaaaclaaaaaf
bcaabaaaaaaaaaaaakaabaaaaaaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaaadpdiaaaaahecaabaaaaeaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaaadoefaaaaajpcaabaaaafaaaaaaigaabaaaaeaaaaaaeghobaaa
acaaaaaaaagabaaaacaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaabaaaaaa
abeaaaaaaaaaaadpdiaaaaahicaabaaaaeaaaaaaakaabaaaaaaaaaaaabeaaaaa
aaaaaadoefaaaaajpcaabaaaaeaaaaaamgaabaaaaeaaaaaaeghobaaaacaaaaaa
aagabaaaacaaaaaaaaaaaaahfcaabaaaaaaaaaaaagbbbaaaabaaaaaaagbbbaaa
abaaaaaaefaaaaajpcaabaaaagaaaaaaigaabaaaaaaaaaaaeghobaaaabaaaaaa
aagabaaaadaaaaaadcaaaaakbcaabaaaaaaaaaaaakaabaaaagaaaaaaabeaaaaa
aaaaiaeabkiacaaaaaaaaaaaabaaaaaadcaaaaajbcaabaaaaaaaaaaabkaabaaa
acaaaaaaabeaaaaaklkkkkdnakaabaaaaaaaaaaadiaaaaahbcaabaaaaaaaaaaa
akaabaaaaaaaaaaaabeaaaaamdpfmieaenaaaaagbcaabaaaaaaaaaaaaanaaaaa
akaabaaaaaaaaaaadcaaaaajbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
aaaaaadpabeaaaaaaaaaaadpdcaaaaajbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaamiebabeaaaaaaaaalaeadiaaaaahbcaabaaaagaaaaaaakaabaaa
aaaaaaaaabeaaaaaaaaaaadndgaaaaafccaabaaaagaaaaaaabeaaaaaaaaafadp
efaaaaajpcaabaaaagaaaaaaegaabaaaagaaaaaaeghobaaaacaaaaaaaagabaaa
acaaaaaabpaaaeaddkaabaaaabaaaaaaefaaaaampcaabaaaahaaaaaaaceaaaaa
aaaaiadmaaaahadpaaaaaaaaaaaaaaaadghjbaaaacaaaaaaaagabaaaacaaaaaa
dgaaaaafhccabaaaaaaaaaaajgahbaaaahaaaaaadgaaaaafbcaabaaaaaaaaaaa
abeaaaaappppppppbcaaaaabdiaaaaahecaabaaaaaaaaaaabkaabaaaabaaaaaa
abeaaaaaaaaahpedblaaaaafecaabaaaaaaaaaaackaabaaaaaaaaaaadjaaaaah
bcaabaaaabaaaaaaakaabaaaacaaaaaaabeaaaaaaaaaiadpccaaaaahbcaabaaa
aaaaaaaaabeaaaaaafaaaaaadkaabaaaacaaaaaaabaaaaahbcaabaaaabaaaaaa
akaabaaaaaaaaaaaakaabaaaabaaaaaabpaaaeadakaabaaaabaaaaaadjaaaaak
lcaabaaaabaaaaaaegaibaaaadaaaaaaaceaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
aaaaaaaadmaaaaahbcaabaaaabaaaaaabkaabaaaabaaaaaaakaabaaaabaaaaaa
dmaaaaahbcaabaaaabaaaaaadkaabaaaabaaaaaaakaabaaaabaaaaaadhaaaaaj
bcaabaaaacaaaaaaakaabaaaabaaaaaaabeaaaaaaaaaiadpakaabaaaacaaaaaa
bfaaaaabaaaaaaaipcaabaaaadaaaaaaegaobaiaebaaaaaaafaaaaaaegaobaaa
aeaaaaaadcaaaaajpcaabaaaadaaaaaaagaabaaaacaaaaaaegaobaaaadaaaaaa
egaobaaaafaaaaaaccaaaaahbcaabaaaabaaaaaaabeaaaaaadaaaaaackaabaaa
aaaaaaaaabaaaaahccaabaaaabaaaaaaakaabaaaabaaaaaaabeaaaaamnmmmmdn
aaaaaaaipcaabaaaaeaaaaaaegaobaiaebaaaaaaadaaaaaaegaobaaaagaaaaaa
dcaaaaajpcaabaaaadaaaaaafgafbaaaabaaaaaaegaobaaaaeaaaaaaegaobaaa
adaaaaaaboaaaaahccaabaaaabaaaaaackaabaaaaaaaaaaaabeaaaaapmpppppp
dhaaaaajecaabaaaaaaaaaaaakaabaaaabaaaaaabkaabaaaabaaaaaackaabaaa
aaaaaaaaaaaaaaalpcaabaaaaeaaaaaaegaobaiaebaaaaaaadaaaaaaaceaaaaa
aaaaiadpaaaaaaaaaaaaiadpaaaaiadpdcaaaaajpcaabaaaaeaaaaaakgakbaaa
abaaaaaaegaobaaaaeaaaaaaegaobaaaadaaaaaacaaaaaakdcaabaaaabaaaaaa
kgakbaaaaaaaaaaaaceaaaaaabaaaaaaacaaaaaaaaaaaaaaaaaaaaaaaaaaaaal
pcaabaaaafaaaaaaegaobaiaebaaaaaaadaaaaaaaceaaaaaaaaaaaaaaaaaiadp
jkjjbjdpaaaaiadpdcaaaaajpcaabaaaafaaaaaakgakbaaaabaaaaaaegaobaaa
afaaaaaaegaobaaaadaaaaaadhaaaaajpcaabaaaadaaaaaafgafbaaaabaaaaaa
egaobaaaafaaaaaaegaobaaaadaaaaaadhaaaaajpcaabaaaabaaaaaaagaabaaa
abaaaaaaegaobaaaaeaaaaaaegaobaaaadaaaaaaefaaaaampcaabaaaadaaaaaa
aceaaaaaaaaaeadnaaaahadpaaaaaaaaaaaaaaaaeghobaaaacaaaaaaaagabaaa
acaaaaaadiaaaaaiecaabaaaaaaaaaaabkaabaaaacaaaaaaakiacaaaaaaaaaaa
aeaaaaaadiaaaaahecaabaaaaaaaaaaackaabaaaaaaaaaaaabeaaaaaijiiaidn
aaaaaaaipcaabaaaacaaaaaaegaobaiaebaaaaaaabaaaaaaegaobaaaadaaaaaa
dcaaaaajpcaabaaaahaaaaaakgakbaaaaaaaaaaadgajbaaaacaaaaaadgajbaaa
abaaaaaadgaaaaafhccabaaaaaaaaaaajgahbaaaahaaaaaabfaaaaabefaaaaaj
pcaabaaaabaaaaaangafbaaaaaaaaaaaeghobaaaadaaaaaaaagabaaaaaaaaaaa
bpaaaeadakaabaaaaaaaaaaadjaaaaakhcaabaaaaaaaaaaaegacbaaaabaaaaaa
aceaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaadmaaaaahbcaabaaaaaaaaaaa
bkaabaaaaaaaaaaaakaabaaaaaaaaaaadmaaaaahbcaabaaaaaaaaaaackaabaaa
aaaaaaaaakaabaaaaaaaaaaadhaaaaajiccabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaaaaaaaaaakaabaaaahaaaaaabcaaaaabdgaaaaaficcabaaaaaaaaaaa
akaabaaaahaaaaaabfaaaaabdoaaaaab"
}
}
 }
}
}