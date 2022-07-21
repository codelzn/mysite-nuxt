varying vec2 vUv;
uniform float uTime;

void main() {
  gl_FragColor = vec4(vUv, sin(uTime) / 2.0 + 0.5, 1.0);
}