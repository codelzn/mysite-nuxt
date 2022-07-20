varying vec2 vUv;
varying vec3 vPosition;
uniform float uTime;

void main () {
  vUv = uv;
  vPosition = position;
  vec4 modelPosition = modelMatrix * vec4( position, 1.0 );
  gl_Position = projectionMatrix * viewMatrix * modelPosition;
}