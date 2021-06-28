// Compiled shader for all platforms, uncompressed size: 0.1KB

Shader "Futile/Solid" {
Properties {
 _MainTex ("Base (RGB)", 2D) = "white" {}
}
SubShader { 
 Pass {
  SetTexture [_MainTex] { combine texture }
 }
}
}