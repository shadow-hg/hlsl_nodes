UV = float2(dot(UV, uvRotation.xy), dot(UV,uvScale.xy)) + uvOffset.xy;
float4 cachecolor = TextureExternalSample(MainTex, MainTexSampler,UV);
if(width > 0){
    cachecolor = float3(0,0,0,0);
    for(int i = 0; i <= width ; i++){
        cachecolor =cachecolor + TextureExternalSample(MainTex,MainTexSampler,UV.xy + (i * offset01.xy * screensize.x));
        cachecolor =cachecolor + TextureExternalSample(MainTex,MainTexSampler,UV.xy + (i * offset02.xy * screensize.x));
        cachecolor =cachecolor + TextureExternalSample(MainTex,MainTexSampler,UV.xy + (i * offset03.xy * screensize.x));
        cachecolor =cachecolor + TextureExternalSample(MainTex,MainTexSampler,UV.xy + (i * offset04.xy * screensize.x));
        //以上只取了上下左右四个方向，还可以在下方增加左上左下和右上右下四个方向的采样，从而提高模糊精度
    }
    cachecolor = cachecolor/((width + 1 )* 4);
}
return cachecolor;
