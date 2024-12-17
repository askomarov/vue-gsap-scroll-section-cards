<script setup lang="ts">
interface Props {
  title?: string
  text?: string
}

const props = withDefaults(defineProps<Props>(), {
  title: 'Download and install the app',
  text: 'Your manager will send you a link that you can use to download the mobile app. ',
})
</script>

<template>
  <div class="big-card">
    <h3 class="gradient-title text-2xl font-bold">{{ props.title }}</h3>
    <p class="text-lg text-white">
      {{ props.text }}
    </p>
  </div>
</template>

<style scoped>
.big-card {
  display: inline-flex;
  flex-direction: column;
  gap: 20px;
  padding: 40px;
  aspect-ratio: 1;
  width: 100%;
  max-width: 400px;
  border-radius: 16px;
  background: var(--gradient-back, linear-gradient(180deg, #1c1b1b 0%, rgba(28, 27, 27, 0) 100%));
  backdrop-filter: blur(16px);

  &::after {
    user-select: none;
    pointer-events: none;
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    border-radius: inherit;
    border: 1px solid transparent;
    background: linear-gradient(180deg, #fff, #0c0c0c) border-box;
    -webkit-mask:
      linear-gradient(#fff 0 0) padding-box,
      linear-gradient(#fff 0 0);
    -webkit-mask-composite: destination-out;
    mask-composite: exclude;
  }
}

.gradient-title {
  background: var(
    --gradient-heading,
    linear-gradient(101deg, #ffba03 15.82%, #e9d98f 51.56%, #ffba03 85.23%)
  );
  background-clip: text;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}
</style>
