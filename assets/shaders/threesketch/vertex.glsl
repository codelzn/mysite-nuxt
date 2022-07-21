varying vec2 vUv;
varying vec4 vPosition;
varying vec3 gPosition;

void main () {
  vUv = uv;
  gPosition = position;
  vec4 modelPosition = modelMatrix * vec4( position, 1.0 );
  vPosition = modelPosition;
  gl_Position = projectionMatrix * viewMatrix * modelPosition;
}