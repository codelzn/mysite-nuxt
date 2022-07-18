<template>
  <div>
    <h1 class="text-center text-7xl text-orange-400">僕のサイト</h1>
    <Background />
  </div>
</template>
<script lang="ts" setup>
useHead({
  title: '僕のサイト',
})
const { gsap } = useGsap()
onMounted(() => {
  gsap.fromTo('h1', {
    opacity: 0,
    y: -100,
  }, {
    opacity: 1,
    y: 0,
    duration: 1,
  })
})
</script>