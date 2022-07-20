<template>
  <div>
    <h1>Home Page</h1>
    <section class="s1">
      <img ref="img1" src="/smiles.png" alt="smiles" class="max-w-md" />
    </section>
    <section class="s2">
      <img ref="img2" src="/smiles.png" alt="smiles" class="max-w-md" />
    </section>
  </div>
</template>
<script lang="ts" setup>
const img1 = ref<HTMLElement>(null);
const img2 = ref<HTMLElement>(null);
useHead({
  title: "Home Page",
});
const { gsap } = useGsap();
const initGsap = () => {
  gsap.to(img1.value, {
    duration: 1,
    delay: 0.5,
    x: 100,
    backgroundColor: "#ffff00",
    ease: "power2.inOut",
  });
};
onMounted(() => {
  initGsap();
});
</script>
<style lang="scss" scoped></style>
