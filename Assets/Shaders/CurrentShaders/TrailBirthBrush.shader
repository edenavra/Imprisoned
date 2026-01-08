Shader "Custom/TrailBirthBrush"
{
    Properties
    {
        // the existing texture to read from
        _MainTex ("Source Texture", 2D) = "black" {}
        // data coming from script RenderTextureTrailPainter
        _BrushCenter ("Brush Center (UV)", Vector) = (0.5, 0.5, 0, 0)
        _BrushHalfSize ("Brush Half Size", Vector) = (0.05, 0.05, 0, 0)
        _Value ("Generation Value", Float) = 0.0
        _BrushOpacity ("Brush Opacity", Float) = 1.0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            struct appdata {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float4 _BrushCenter;
            float4 _BrushHalfSize;
            float _Value;
            float _BrushOpacity;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                // read the existing value from the texture
                float4 existingValue = tex2D(_MainTex, i.uv);

                // calculate distance from brush center
                // here we use absolute distance since the brush is a square
                float2 dist = abs(i.uv - _BrushCenter.xy);

                // אם הפיקסל נמצא בתוך הריבוע של המברשת
                if (dist.x < _BrushHalfSize.x && dist.y < _BrushHalfSize.y)
                {
                    // write the new value, blended with existing based on opacity
                    // we use max to ensure we only increase the value
                    float newVal = max(existingValue.r, _Value);
                    return float4(newVal, 0, 0, 1.0);
                }

                //here we are outside the brush area, keep existing value
                return existingValue;
            }
            ENDCG
        }
    }
}