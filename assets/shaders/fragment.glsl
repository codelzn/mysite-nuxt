// varying float vNoise;
varying vec2 vUv;

// uniform sampler2D oceanTexture;
uniform float uTime;

void main() {
  // vec3 color1 = vec3(1.,0.,0.);
  // vec3 color2 = vec3(1.,1.,1.);
  // vec3 finalColor = mix(color1, color2, (vNoise + 1.) / 2.);

  // vec2 newUV = vUv;

  // newUV = vec2(newUV.x, newUV.y + 0.01*sin(newUV.x*10.0 + time));

  // vec4 oceanView = texture2D( oceanTexture, newUV );

  // gl_FragColor = vec4(finalColor, 1.0);
  // gl_FragColor = vec4(vUv, 0.0, 1.0);
  // gl_FragColor = oceanView + 0.5 * vec4(vNoise);
  // gl_FragColor = vec4(vec3(vNoise), 1.0);
  gl_FragColor = vec4(vUv, sin(uTime) / 2.0 + 0.5, 1.0);
}