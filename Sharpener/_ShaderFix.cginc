// When rendering to a RenderTexture, Unity tries to flip the projection matrix so everything renders upside down.
// This is really bad, because none of the shaders in rain world are coded to handle this.
// So, we tell Unity to get lost and override ComputeScreenPos() so that it ignores the "flip the Y dir" thing.
// To go along with us changing the projection matrix.

#define ComputeScreenPos(p) _ComputeScreenPos(p)

inline float4 _ComputeScreenPos (float4 pos) {
	float4 o = pos * 0.5f;
	#if defined(UNITY_HALF_TEXEL_OFFSET)
	o.xy += o.w * _ScreenParams.zw;
	#else
	o.xy += o.w;
	#endif
	
	#if defined(SHADER_API_FLASH)
	o.xy *= unity_NPOTScale.xy;
	#endif
	
	o.zw = pos.zw;
	return o;
}