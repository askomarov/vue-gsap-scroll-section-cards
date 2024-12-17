<script setup lang="ts">
import { RouterLink, RouterView } from 'vue-router'
import { Routes } from '@/types/routes'

import gsap from 'gsap'
import { ScrollTrigger } from 'gsap/ScrollTrigger'

gsap.registerPlugin(ScrollTrigger)
</script>

<template>
  <header>
    <nav class="flex justify-center gap-4 *:text-xl">
      <RouterLink :to="{ name: Routes.Home }" exact-active-class="text-blue-600">Home</RouterLink>

      <RouterLink :to="{ name: Routes.About }" exact-active-class="text-blue-600">About</RouterLink>
    </nav>
  </header>

  <RouterView />
</template>
