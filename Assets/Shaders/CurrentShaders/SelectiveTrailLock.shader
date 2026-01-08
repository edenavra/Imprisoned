Shader "Custom/SelectiveTrailLock"
{
    Properties
    {
        _MainTex ("State Texture", 2D) = "black" {}
        _MethodTex ("Method Texture", 2D) = "black" {}
    }
    SubShader
    {
        Cull Off ZWrite Off ZTest Always
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            sampler2D _MainTex;
            sampler2D _MethodTex;

            struct appdata { float4 vertex : POSITION; float2 uv : TEXCOORD0; };
            struct v2f { float4 vertex : SV_POSITION; float2 uv : TEXCOORD0; };

            v2f vert (appdata v) {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                float state = tex2D(_MainTex, i.uv).r;
                float method = tex2D(_MethodTex, i.uv).r;

                //if the Method is 0 (edge), we set the State to 1 to lock the trail
                // if the Method is 1 (fill), we keep the State as is
                if (method < 0.5) {
                    return float4(1, 0, 0, 1);
                }
                
                return float4(state, 0, 0, 1);
            }
            ENDCG
        }
    }
}