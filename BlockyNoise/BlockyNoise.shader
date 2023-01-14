#version 150

uniform float time;
uniform vec2 resolution;

out vec4 fragColor;

float GetRandom1D(vec2 cords)
{
    float timeSlice = 0.000005; 
    return fract(time*timeSlice* sin(dot(cords.xy,
    vec2(12.9898,78.233)))*
    111111.5453123);
}

vec4 GetAnimatedColor()
{
    float base = 0.8;
    vec3 freq = vec3(0.2,0.1,0.6);
    vec3 amplitude = vec3(2,5,1);

    float r = base + abs(amplitude.x * sin(time * freq.x));
    float g = base + abs(amplitude.y * cos(time * freq.y));
    float b = base + abs(amplitude.z * sin(time * freq.z));
    
    return vec4(fract(r),fract(g),fract(b),1);
}

void main(void)
{
    vec2 uvSample = gl_FragCoord.xy/resolution.xy;
    uvSample *= 50;
    vec2 iSample = floor(uvSample);
    vec2 fSample = fract(uvSample);
    
    float randNumber  =  GetRandom1D(iSample);
    fragColor = vec4(vec3(randNumber),1);
}