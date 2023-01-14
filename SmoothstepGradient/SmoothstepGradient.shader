#version 150

uniform float time;
uniform vec4 firstColor;
uniform vec4 secondColor;
uniform float edge1;
uniform float edge2;
uniform float enableU;
uniform float enableV;

uniform vec2 resolution;

out vec4 fragColor;

float GetSampledFactorValue(vec2 sampleUV)
{
   float uVal = round(enableU) * sampleUV.x;
   float vVal = round(enableV) * sampleUV.y;
    return uVal + vVal;
    
}

void main(void)
{
    vec2 sampleUV = gl_FragCoord.xy/resolution;
    float interpolationFactor = smoothstep(edge1,edge2, GetSampledFactorValue(sampleUV));
    vec4 sampledColor =  mix(firstColor,secondColor,    interpolationFactor); 
    
    fragColor = sampledColor;
}