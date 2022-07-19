<script lang="ts" setup>
import * as THREE from 'three'
import fragmentShader from '~/assets/shaders/fragment.glsl'
import vertexShader from '~/assets/shaders/vertex.glsl'

const { gsap } = useGsap()
let sketch: Sketch
const canvas = ref<HTMLCanvasElement>(null)
class Sketch {
  public scene: THREE.Scene
  public camera: THREE.PerspectiveCamera
  public renderer: THREE.WebGLRenderer
  public geometry: THREE.SphereBufferGeometry
  public material: THREE.ShaderMaterial
  public mesh: THREE.Mesh
  public clock: THREE.Clock
  constructor() {
    this.scene = new THREE.Scene()
    this.camera = new THREE.PerspectiveCamera(70, window.innerWidth / window.innerHeight, 0.1, 10)
    this.camera.position.z = 1
    this.renderer = new THREE.WebGLRenderer({
      canvas: canvas.value,
      antialias: true,
      alpha: true,
      precision: 'highp',
      powerPreference: 'high-performance',
    })
    this.renderer.setSize(window.innerWidth, window.innerHeight)
    this.renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2))
    this.clock = new THREE.Clock()
    this.geometry = new THREE.SphereBufferGeometry(0.3, 32, 32)
    this.material = new THREE.ShaderMaterial({
      side: THREE.DoubleSide,
      wireframe: true,
      uniforms: {
        uTime: { value: 0 },
        customA: { value: 0 },
      },
      vertexShader,
      fragmentShader,
    })
    this.mesh = new THREE.Mesh(this.geometry, this.material)
    this.scene.add(this.mesh)
    this.animate()
    this.resize()
  }
  public animate() {
    requestAnimationFrame(() => this.animate())
    this.mesh!.rotation.x = this.clock.getElapsedTime()
    this.mesh!.rotation.y = this.clock.getElapsedTime()
    this.material.uniforms.uTime.value = this.clock.getElapsedTime()
    this.renderer.render(this.scene, this.camera)
  }
  public resize() {
    this.resizeHandler()
    window.addEventListener('resize', this.resizeHandler.bind(this))
  }
  private resizeHandler() {
    this.camera.aspect = window.innerWidth / window.innerHeight
    this.camera.updateProjectionMatrix()
    this.renderer.setSize(window.innerWidth, window.innerHeight)
    this.renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2))
  }
}
onMounted(() => {
  sketch = new Sketch()
  gsap.to(sketch.material.uniforms.customA, {
    duration: 3,
    value: 0.4,
    repeat: -1,
    yoyo: true,
  })
})
onUnmounted(() => {
  gsap.killTweensOf(sketch.material.uniforms.customA)
})
</script>
<template>
  <canvas class="fixed -z-10 top-0 left-0" ref="canvas" />
</template>