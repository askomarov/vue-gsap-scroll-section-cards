<script setup lang="ts">
import SectionAnimation from '@/components/SectionAnimation.vue'
import Fieldset from 'primevue/fieldset'
</script>

<template>
  <main class="container">
    <Fieldset
      toggleable
      :collapsed="false"
      legend="Вступление"
      class="bg-green-50"
      :pt="{ legend: { class: 'bg-green-100' } }"
    >
      <p class="m-0">
        На этой странице демонстрируется анимация карточек с использованием библиотеки GSAP и Vue.
        При прокрутке страницы карточки плавно появляются, а соответствующие элементы пагинации
        получают класс "active". Анимация инициализируется в хуке `onMounted` и удаляется в хуке
        `onUnmounted`. <br />
        Чтобы увидеть анимацию, прокрутите страницу вниз.
      </p>
    </Fieldset>
    <div
      class="flex min-h-screen flex-col items-center justify-center text-[#ffba03] outline outline-1 outline-purple-400"
    >
      <p>spacer</p>
    </div>
    <SectionAnimation />
    <div
      class="flex min-h-screen flex-col items-center justify-center text-[#ffba03] outline outline-1 outline-purple-400"
    >
      <p>spacer</p>
    </div>
  </main>
</template>
