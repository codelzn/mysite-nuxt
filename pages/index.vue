<template>
  <div>
    <Background class="blur-sm" />
    <h1 class="text-7xl text-orange-400 text-center">Code LZN</h1>
    <h2 class="text-5xl text-blue-500 text-center mt-3">サイト開発中です</h2>
  </div>
</template>
<script lang="ts" setup>
useHead({
  title: "Code LZN Blog",
});
const { gsap } = useGsap();
onMounted(() => {
  gsap.fromTo(
    "h1",
    {
      opacity: 0,
      y: -100,
    },
    {
      opacity: 1,
      y: 0,
      duration: 1,
    }
  );
  gsap.fromTo(
    "h2",
    {
      opacity: 0,
      y: -200,
    },
    {
      opacity: 1,
      y: 0,
      duration: 1,
    }
  );
});
</script>
