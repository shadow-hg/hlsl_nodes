float CustomTime = Time.x;
half2 CustomUV = UV.xy * Tiling.xy + (CustomTime * Offset.xy);
fixed3 MaskTex0 = Texture2DSample(MainTex,MainTexSampler,CustomUV);

if(MaskTex0.r <= (Value.x + Width.x)){
    float CacheMask = MaskTex0.r;
    CacheMask = 1.0;
    EmissColor.xyz = CacheMask * EmissColor.xyz;
} 
else{
    EmissColor = 0;
}

if(Value.x > 0)
{
    if(MaskTex0.r <= Value.x){
        MaskTex0.r = 0;
    }
    else{
        MaskTex0.r = 1;
    }
}
else{
    MaskTex0.r = 1;
}

OpacityMask.x = MaskTex0;
Emission.xyz = EmissColor * EmissionStrength.r;
return 0;
