varying vec2 vUv;
varying vec3 vPosition;
uniform float uTime;
// uniform sampler2D uTexture1;
// uniform sampler2D uTexture2;
// uniform sampler2D uTexture3;

void main() {
  // gl_FragColor = vec4(vUv, 0.0, 1.0);

  // // 短范围内剧烈渐变
  // float strength = vUv.y * 10.0;
  // gl_FragColor = vec4(strength, strength, strength, 1.0);

  // // 利用取模达到反复效果 取余数 小数点后面的
  // float strength = mod(vUv.y * 10.0, 1.0);
  // gl_FragColor = vec4(strength, strength, strength, 1.0);

  // // 利用step达到纯色效果 斑马条纹
  // float strength = mod(vUv.y * 10.0, 1.0);
  // // strength = strength > 0.5 ? 1.0 : 0.0;
  // strength = step(0.5, strength);
  // gl_FragColor = vec4(strength, strength, strength, 1.0);

  // // 利用step达到纯色效果 斑马条纹 图形相加
  // float strength = step(0.5,mod(vUv.y * 10.0, 1.0));
  // // strength = strength > 0.5 ? 1.0 : 0.0;
  // strength -= step(0.5,mod(vUv.x * 10.0, 1.0));
  // gl_FragColor = vec4(strength, strength, strength, 1.0);

// // 条纹偏移
//   float barX = step(0.4, mod(vUv.x * 10.0, 1.0)) * step(0.8, mod(vUv.y * 10.0, 1.0));
//   float barY = step(0.4, mod(vUv.y * 10.0, 1.0)) * step(0.8, mod(vUv.x * 10.0, 1.0));
//   float strength = barX + barY;
//   gl_FragColor = vec4(vec3(strength), 1.0);
//   gl_FragColor = vec4(vUv, 1.0, strength);

// 动画
  // float barX = step(0.4, mod((vUv.x + uTime * 0.1) * 10.0, 1.0)) * step(0.8, mod((vUv.y + uTime * 0.1) * 10.0, 1.0));
  // float barY = step(0.4, mod((vUv.y + uTime * 0.1) * 10.0, 1.0)) * step(0.8, mod((vUv.x + uTime * 0.1) * 10.0, 1.0));
  // float strength = barX + barY;
  // gl_FragColor = vec4(vec3(strength), 1.0);
  // gl_FragColor = vec4(vUv, 1.0, 1.0 - strength);

  // T字型
  // float barX = step(0.4, mod(vUv.x * 10.0 - 0.2, 1.0)) * step(0.8, mod((vUv.y) * 10.0, 1.0));
  // float barY = step(0.4, mod((vUv.y) * 10.0, 1.0)) * step(0.8, mod((vUv.x) * 10.0, 1.0));
  // float strength = barX + barY;
  // gl_FragColor = vec4(vec3(strength), 1.0);
  // gl_FragColor = vec4(vUv, 1.0, 1.0 - strength);

  // 绝对值
  float strength = abs(vUv.x - 0.5) + abs(vUv.y - 0.5);
  gl_FragColor = vec4(vec3(strength), 1.0);
}