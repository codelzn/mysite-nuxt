varying vec2 vUv;
varying vec3 vPosition;
uniform float uTime;
uniform sampler2D uTexture1;
uniform sampler2D uTexture2;

void main() {
  vec4 texture1 = texture2D(uTexture1, vUv);
  vec4 texture2 = texture2D(uTexture2, vUv);
  gl_FragColor = mix(texture1, texture2, sin(uTime) * 0.5 + 0.5);
}