<script lang="ts" setup>
import * as THREE from 'three'
import fragmentShader from '~/assets/shaders/fragment.glsl'
import vertexShader from '~/assets/shaders/vertex.glsl'

const canvas = ref<HTMLCanvasElement>(null)
class Sketch {
  public scene: THREE.Scene
  public camera: THREE.PerspectiveCamera
  public renderer: THREE.WebGLRenderer
  public geometry: THREE.BoxGeometry
  public material: THREE.ShaderMaterial
  public mesh: THREE.Mesh
  constructor() {
    this.scene = new THREE.Scene()
    this.camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000)
    this.camera.position.z = 5
    this.renderer = new THREE.WebGLRenderer({
      canvas: canvas.value,
      antialias: true,
    })
    this.renderer.setSize(window.innerWidth, window.innerHeight)
    this.geometry = new THREE.BoxGeometry(1, 1, 1)
    this.material = new THREE.ShaderMaterial({
      uniforms: {
        time: { value: 0 },
      },
      vertexShader,
      fragmentShader,
    })
    this.mesh = new THREE.Mesh(this.geometry, this.material)
    this.scene.add(this.mesh)
    this.renderer.render(this.scene, this.camera)
  }
}
onMounted(() => {
  new Sketch()
})
</script>
<template>
  <canvas class="fixed h-screen w-screen -z-10" ref="canvas" />
</template>