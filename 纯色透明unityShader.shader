Shader "Unlit/Emiss01"
{
    Properties
    {
        [HDR] _EmissionColor("EmissColor",color) = (1,1,1) 
        _Alpha("Alpha",float) = 0.5
    }
    SubShader
    {
        Tags{"RenderType" = "Transparent" "Queue" = "Transparent" "IgnoreProject" = "true" "LightMode" = "ForWardBase" }
        Blend SrcAlpha OneMinusSrcAlpha //透明度混合
        ZWrite On //开启深度写入
        Cull back //剔除背面

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                
                float4 vertex : SV_POSITION;
            };

            half3 _EmissionColor;
            fixed _Alpha;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                
                return half4(_EmissionColor,_Alpha);
            }
            ENDCG
        }
    }
}
