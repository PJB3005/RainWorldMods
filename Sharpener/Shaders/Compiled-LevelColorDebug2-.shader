// Compiled shader for all platforms, uncompressed size: 34.7KB

Shader "Futile/LevelColorDebug2" {
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
 //        gles : 119 math, 7 texture, 12 branch
 //       gles3 : 119 math, 7 texture, 12 branch
 //   glesdesktop : 119 math, 7 texture, 12 branch
 //       metal : 3 math
 //      opengl : 5 math
 // Stats for Fragment shader:
 //       d3d11 : 28 math, 5 texture, 3 branch
 //        d3d9 : 65 math, 5 texture, 3 branch
 //       metal : 119 math, 7 texture, 12 branch
 //      opengl : 60 math, 5 texture
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
ConstBuffer "$Globals" 112
Vector 96 [_MainTex_ST]
ConstBuffer "UnityPerDraw" 336
Matrix 0 [glstate_matrix_mvp]
BindCB  "$Globals" 0
BindCB  "UnityPerDraw" 1
"vs_4_0
eefiecedchaikadligjbhcfghhamnphaeedeljplabaaaaaacmacaaaaadaaaaaa
cmaaaaaakaaaaaaapiaaaaaaejfdeheogmaaaaaaadaaaaaaaiaaaaaafaaaaaaa
aaaaaaaaaaaaaaaaadaaaaaaaaaaaaaaapapaaaafjaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaahaaaaaagaaaaaaaaaaaaaaaaaaaaaaaadaaaaaaacaaaaaa
apadaaaafaepfdejfeejepeoaaeoepfcenebemaafeeffiedepepfceeaaklklkl
epfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaaaaaaaaaaabaaaaaaadaaaaaa
aaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaaadaaaaaaabaaaaaaadamaaaa
fdfgfpfaepfdejfeejepeoaafeeffiedepepfceeaaklklklfdeieefccmabaaaa
eaaaabaaelaaaaaafjaaaaaeegiocaaaaaaaaaaaahaaaaaafjaaaaaeegiocaaa
abaaaaaaaeaaaaaafpaaaaadpcbabaaaaaaaaaaafpaaaaaddcbabaaaacaaaaaa
ghaaaaaepccabaaaaaaaaaaaabaaaaaagfaaaaaddccabaaaabaaaaaagiaaaaac
abaaaaaadiaaaaaipcaabaaaaaaaaaaafgbfbaaaaaaaaaaaegiocaaaabaaaaaa
abaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaaaaaaaaaaagbabaaa
aaaaaaaaegaobaaaaaaaaaaadcaaaaakpcaabaaaaaaaaaaaegiocaaaabaaaaaa
acaaaaaakgbkbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaakpccabaaaaaaaaaaa
egiocaaaabaaaaaaadaaaaaapgbpbaaaaaaaaaaaegaobaaaaaaaaaaadcaaaaal
dccabaaaabaaaaaaegbabaaaacaaaaaaegiacaaaaaaaaaaaagaaaaaaogikcaaa
aaaaaaaaagaaaaaadoaaaaab"
}




}
Program "fp" {


SubProgram "d3d11 " {
// Stats: 28 math, 5 textures, 3 branches
SetTexture 0 [_MainTex] 2D 1
SetTexture 1 [_NoiseTex] 2D 3
SetTexture 2 [_PalTex] 2D 2
SetTexture 3 [_GrabTexture] 2D 0
ConstBuffer "$Globals" 112
Float 20 [_RAIN]
Vector 32 [_spriteRect]
Float 68 [_waterLevel]
Float 80 [_WetTerrain]
BindCB  "$Globals" 0
"ps_4_0
eefiecedjofpngoaoicacimfkmfklolnhmdgkfbnabaaaaaaheagaaaaadaaaaaa
cmaaaaaaieaaaaaaliaaaaaaejfdeheofaaaaaaaacaaaaaaaiaaaaaadiaaaaaa
aaaaaaaaabaaaaaaadaaaaaaaaaaaaaaapaaaaaaeeaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaabaaaaaaadadaaaafdfgfpfaepfdejfeejepeoaafeeffiedepepfcee
aaklklklepfdeheocmaaaaaaabaaaaaaaiaaaaaacaaaaaaaaaaaaaaaaaaaaaaa
adaaaaaaaaaaaaaaapaaaaaafdfgfpfegbhcghgfheaaklklfdeieefcleafaaaa
eaaaaaaagnabaaaafjaaaaaeegiocaaaaaaaaaaaagaaaaaafkaaaaadaagabaaa
aaaaaaaafkaaaaadaagabaaaabaaaaaafkaaaaadaagabaaaacaaaaaafkaaaaad
aagabaaaadaaaaaafibiaaaeaahabaaaaaaaaaaaffffaaaafibiaaaeaahabaaa
abaaaaaaffffaaaafibiaaaeaahabaaaacaaaaaaffffaaaafibiaaaeaahabaaa
adaaaaaaffffaaaagcbaaaaddcbabaaaabaaaaaagfaaaaadpccabaaaaaaaaaaa
giaaaaacabaaaaaaefaaaaajpcaabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaa
aaaaaaaaaagabaaaabaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaafgffdfeabnaaaaaiccaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaia
ebaaaaaaaaaaaaaabkaaaaagbcaabaaaaaaaaaaaakaabaiaibaaaaaaaaaaaaaa
dhaaaaakbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaia
ebaaaaaaaaaaaaaadcaaaaajbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
aaaaleecabeaaaaaaaaaialpdiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
abeaaaaaijiiaidnbnaaaaaiccaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaia
ebaaaaaaaaaaaaaabkaaaaagbcaabaaaaaaaaaaaakaabaiaibaaaaaaaaaaaaaa
dhaaaaakbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaaakaabaia
ebaaaaaaaaaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
mnmmmmdndcaaaaandcaabaaaaaaaaaaaegbabaaaabaaaaaaaceaaaaaaaaamadp
aaaaiadoaaaaaaaaaaaaaaaaagaabaiaebaaaaaaaaaaaaaadcaaaaandcaabaaa
aaaaaaaafgifcaaaaaaaaaaaabaaaaaaaceaaaaaaknhcddmmnmmemdnaaaaaaaa
aaaaaaaaegaabaaaaaaaaaaaefaaaaajpcaabaaaaaaaaaaaegaabaaaaaaaaaaa
eghobaaaabaaaaaaaagabaaaadaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaakbabaaaabaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaa
bkbabaaaabaaaaaadcaaaaakbcaabaaaaaaaaaaabkiacaaaaaaaaaaaabaaaaaa
abeaaaaamnmmmmdnakaabaaaaaaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaa
aaaaaaaaabeaaaaafclibgebenaaaaagbcaabaaaaaaaaaaaaanaaaaaakaabaaa
aaaaaaaaaaaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaddddhdlp
dicaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaaaaaakaebaaaaaaak
ccaabaaaaaaaaaaabkiacaiaebaaaaaaaaaaaaaaacaaaaaadkiacaaaaaaaaaaa
acaaaaaadcaaaaakccaabaaaaaaaaaaabkbabaaaabaaaaaabkaabaaaaaaaaaaa
bkiacaaaaaaaaaaaacaaaaaadbaaaaaiecaabaaaaaaaaaaaakiacaaaaaaaaaaa
afaaaaaaabeaaaaaaaaaaadpaaaaaaaiccaabaaaaaaaaaaabkaabaiaebaaaaaa
aaaaaaaaabeaaaaaaaaaiadpdbaaaaaiccaabaaaaaaaaaaabkiacaaaaaaaaaaa
aeaaaaaabkaabaaaaaaaaaaadmaaaaahccaabaaaaaaaaaaabkaabaaaaaaaaaaa
ckaabaaaaaaaaaaadiaaaaahbcaabaaaaaaaaaaaakaabaaaaaaaaaaaabeaaaaa
gpbciddkdhaaaaajbcaabaaaaaaaaaaabkaabaaaaaaaaaaaabeaaaaaaaaaaaaa
akaabaaaaaaaaaaaaaaaaaahccaabaaaaaaaaaaaakaabaaaaaaaaaaabkbabaaa
abaaaaaadgaaaaafbcaabaaaaaaaaaaaakbabaaaabaaaaaaefaaaaajpcaabaaa
aaaaaaaaegaabaaaaaaaaaaaeghobaaaaaaaaaaaaagabaaaabaaaaaabiaaaaak
hcaabaaaaaaaaaaaegacbaaaaaaaaaaaaceaaaaaaaaaiadpaaaaiadpaaaaiadp
aaaaaaaaabaaaaahbcaabaaaaaaaaaaabkaabaaaaaaaaaaaakaabaaaaaaaaaaa
abaaaaahbcaabaaaaaaaaaaackaabaaaaaaaaaaaakaabaaaaaaaaaaabpaaaead
akaabaaaaaaaaaaaefaaaaampcaabaaaaaaaaaaaaceaaaaaaaaaiadmaaaahadp
aaaaaaaaaaaaaaaaeghobaaaacaaaaaaaagabaaaacaaaaaabcaaaaabefaaaaaj
pccabaaaaaaaaaaaegbabaaaabaaaaaaeghobaaaadaaaaaaaagabaaaaaaaaaaa
doaaaaabbfaaaaabdgaaaaafhccabaaaaaaaaaaaegacbaaaaaaaaaaadgaaaaaf
iccabaaaaaaaaaaaabeaaaaaaaaaaadpdoaaaaab"
}




}
 }
}
}