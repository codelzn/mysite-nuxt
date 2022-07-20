<template>
  <div>
    <Background />
    <h1 ref="title1" class="text-7xl text-orange-400 text-center">Code LZN</h1>
    <h2 ref="title2" class="text-5xl text-blue-500 text-center mt-3">サイト開発中です</h2>
    <NuxtLink href="/gsapsketch">
      <h3 class="text-center text-blue-400 text-4xl">GSAPSketch</h3>
    </NuxtLink>
    <NuxtLink href="/threesketch">
      <h3 class="text-center text-blue-400 text-4xl">THREESketch</h3>
    </NuxtLink>
  </div>
</template>
<script lang="ts" setup>
const title1 = ref<HTMLElement>(null);
const title2 = ref<HTMLElement>(null);
useHead({
  title: "Code LZN Blog",
});
const { gsap } = useGsap();
onMounted(() => {
  gsap.fromTo(
    title1.value,
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
    title2.value,
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
