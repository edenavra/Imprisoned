Shader "Custom/PaintMethodPolygonFill"
{
    Properties
    {
        _Value ("Paint Method Value", Float) = 1
    }

    SubShader
    {
        Tags { "RenderType"="Opaque" }
        ZWrite Off
        ZTest Always
        Cull Off
        Blend One Zero

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            float _Value;

            struct appdata
            {
                float4 vertex : POSITION;
            };

            struct v2f
            {
                float4 pos : SV_POSITION;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                return o;
            }

            float4 frag (v2f i) : SV_Target
            {
                // Write the value to R channel
                return float4(_Value, 0, 0, 0);
            }
            ENDCG
        }
    }
}
