import { Routes } from '@/types/routes'
import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: Routes.Home,
      component: () => import('@/views/HomeView.vue'),
    },
    {
      path: '/about',
      name: Routes.About,
      component: () => import('@/views/AboutView.vue'),
    },
  ],
})

export default router
