float3 cachecolor = Texture2DSample(MainTex,MainTexSampler,UV.xy);
if(width > 0){
    cachecolor = float3(0,0,0);
    for(int i = 0; i <= width ; i++){
        cachecolor =cachecolor + Texture2DSample(MainTex,MainTexSampler,UV.xy + (i * offset01.xy * screensize.x));
        cachecolor =cachecolor + Texture2DSample(MainTex,MainTexSampler,UV.xy + (i * offset02.xy * screensize.x));
        cachecolor =cachecolor + Texture2DSample(MainTex,MainTexSampler,UV.xy + (i * offset03.xy * screensize.x));
        cachecolor =cachecolor + Texture2DSample(MainTex,MainTexSampler,UV.xy + (i * offset04.xy * screensize.x));
        cachecolor =cachecolor + Texture2DSample(MainTex,MainTexSampler,UV.xy + (i * offset05.xy * screensize.x));
        cachecolor =cachecolor + Texture2DSample(MainTex,MainTexSampler,UV.xy + (i * offset06.xy * screensize.x));
        cachecolor =cachecolor + Texture2DSample(MainTex,MainTexSampler,UV.xy + (i * offset07.xy * screensize.x));
        cachecolor =cachecolor + Texture2DSample(MainTex,MainTexSampler,UV.xy + (i * offset08.xy * screensize.x)); 
    }
    cachecolor = cachecolor/((width + 1 )* 8);
}
return cachecolor;
