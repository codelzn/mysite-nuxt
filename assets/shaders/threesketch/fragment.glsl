precision lowp float;
varying vec2 vUv;
varying vec4 vPosition;
varying vec3 gPosition;
uniform float uTime;
uniform sampler2D uTexture1;
uniform sampler2D uTexture2;
uniform sampler2D uTexture3;
#define PI 3.14159265359
void main() {
  vec4 texture1 = texture2D(uTexture1, vUv);
  vec4 texture2 = texture2D(uTexture2, vUv);
  vec4 texture3 = texture2D(uTexture3, vUv);

  float strength = sin(uTime * 2.0) * 0.5 + 0.5;
  vec4 redColor = vec4(vUv, strength, 1.0);
  vec4 yellowColor = vec4(strength, vUv, 1.0);
  vec4 mixedColor = mix(yellowColor, redColor, gPosition.y /3.0);
  gl_FragColor = mixedColor;
}