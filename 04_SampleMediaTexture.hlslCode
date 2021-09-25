float2 Local1 = float2(dot(UV, offset01.xy), dot(UV,offset02.xy)) + offset03.xy;//RotateScaleOffsetTexCoords函数的具体算法，默认float4 RotationScale(1,0,0,1),float2 Offset(0,0)
float4 Local2 = ProcessMaterialExternalTextureLookup(TextureExternalSample(MainTex, MainTexSampler,Local1));//采样MediaTexture时使用的函数
return Local2.xyz;
