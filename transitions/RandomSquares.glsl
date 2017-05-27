// Author: Ben Raziel
// License: MIT
float rand(vec2 co){
  return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

vec4 transition(vec2 uv) {
  float revProgress = (1.0 - progress);
  float distFromEdges = min(progress, revProgress);
  
  vec2 p = uv.xy / vec2(1.0).xy;
  vec4 fromColor = getFromColor(p);
  vec4 toColor = getToColor(p);
  float squareSize = 20.0;
  float flickerSpeed = 60.0;
  
  vec2 seed = floor(uv.xy / squareSize) * floor(distFromEdges * flickerSpeed);
  return mix(fromColor, toColor, progress) + rand(seed) * distFromEdges * 0.5;
}
