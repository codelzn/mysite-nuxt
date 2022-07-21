<template>
  <canvas id="canvas" ref="canvas"></canvas>
</template>
<script lang="ts" setup>
import * as THREE from "three";
import { OrbitControls } from "three/examples/jsm/controls/OrbitControls";
import { RGBELoader } from "three/examples/jsm/loaders/RGBELoader";
import { GLTFLoader } from "three/examples/jsm/loaders/GLTFLoader";
import GUI from "lil-gui";
import vertexShader from "~/assets/shaders/threesketch/vertex.glsl";
import fragmentShader from "~/assets/shaders/threesketch/fragment.glsl";
const canvas = ref<HTMLCanvasElement>(null);
let sketch: Sketch;
class Sketch {
  scene: THREE.Scene;
  camera: THREE.PerspectiveCamera;
  renderer: THREE.WebGLRenderer;
  controls: OrbitControls;
  clock: THREE.Clock;
  gui: GUI;
  loaderManager: THREE.LoadingManager;
  textureLoader: THREE.TextureLoader;
  rgbeLoader: RGBELoader;
  gltfLoader: GLTFLoader;
  textures: THREE.Texture[] = [];
  materials: THREE.Material[] = [];
  mesh: THREE.Mesh;

  constructor() {
    this.scene = new THREE.Scene();
    this.camera = new THREE.PerspectiveCamera(
      75,
      window.innerWidth / window.innerHeight,
      0.1,
      1000
    );
    this.camera.position.set(0, 0, 4);
    this.renderer = new THREE.WebGLRenderer({
      antialias: true,
      alpha: false,
      canvas: canvas.value,
    });
    this.renderer.setSize(window.innerWidth, window.innerHeight);
    // 不设置这个的话会导致素材失真
    this.renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));
    // 输出模式
    this.renderer.outputEncoding = THREE.sRGBEncoding;
    // 色调映射
    this.renderer.toneMapping = THREE.ACESFilmicToneMapping;
    // 曝光程度
    this.renderer.toneMappingExposure = 0.3;
    this.clock = new THREE.Clock();
    this.loaderManager = new THREE.LoadingManager();
    this.textureLoader = new THREE.TextureLoader(this.loaderManager);
    this.rgbeLoader = new RGBELoader();
    this.gltfLoader = new GLTFLoader(this.loaderManager);
    this.controls = new OrbitControls(this.camera, canvas.value);
    this.controls.enableDamping = true;
    this.gui = new GUI();
    // 异步加载
    this.rgbeLoader.loadAsync("/hdr/night.hdr").then((texture) => {
      texture.mapping = THREE.EquirectangularRefractionMapping;
      this.scene.background = texture;
      this.scene.environment = texture;
    });
    this.gltfLoader.load("/model/flyLight.glb", (gltf) => {
      console.log(gltf);
      this.scene.add(gltf.scene);
    });
    this.textures[0] = this.textureLoader.load("/image/img1.png");
    this.textures[1] = this.textureLoader.load("/image/img2.jpg");
    this.textures[2] = this.textureLoader.load("/smiles.png");
    this.loaderManager.onLoad = () => {
      this.init();
    };
  }
  init() {
    // console.log(this.textures[0].source.data.naturalHeight);
    // console.log(this.textures[0].source.data.naturalWidth);
    this.onResize();
    this.setPlane();
    this.setGui();
    this.render();
  }
  render() {
    requestAnimationFrame(() => this.render());
    this.renderer.render(this.scene, this.camera);
    this.controls.update();
  }

  setGui() {}

  onResize() {
    this.camera.updateProjectionMatrix();
    this.camera.aspect = window.innerWidth / window.innerHeight;
    this.renderer.setSize(window.innerWidth, window.innerHeight);
    this.renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));
  }

  setPlane() {
    const geometry = new THREE.PlaneGeometry(4, 4, 64, 64);
    const material = new THREE.ShaderMaterial({
      side: THREE.DoubleSide,
      transparent: true,
      vertexShader,
      fragmentShader,
    });
    this.materials.push(material);
    this.mesh = new THREE.Mesh(geometry, material);
    // this.scene.add(this.mesh);
  }
}
onMounted(() => {
  sketch = new Sketch();
  window.addEventListener("resize", () => sketch.onResize());
});
onUnmounted(() => {
  window.removeEventListener("resize", () => sketch.onResize());
  // 删除gui
  sketch.gui.destroy();
});
</script>
<style lang="scss" scoped></style>
