<script setup lang="ts">
import { onMounted, onUnmounted, ref } from 'vue'
import gsap from 'gsap'
import BigCard from '@/components/BigCard.vue'

const animation = ref()
let ctx: gsap.Context

const animateSection = () => {
  const mm = gsap.matchMedia()

  mm.add(
    {
      isDesktop: '(min-width: 1024px)',
      isMobile: '(max-width: 1023px)',
    },
    (context) => {
      // @ts-expect-error: context.conditions might not have isDesktop
      const { isDesktop, isMobile } = context.conditions

      if (isDesktop) {
        ctx = gsap.context((self) => {
          gsap.timeline({
            scrollTrigger: {
              trigger: '.anim-container',
              start: 'top top',
              end: 'bottom bottom',
              pin: '.anim-container__pinned-content',
              pinSpacing: false,
            },
          })
          const paginationItems = self.selector
            ? self.selector('.anim-container__pagination-item')
            : []
          paginationItems.forEach((item: HTMLElement) => {
            item.classList.remove('active')
          })
          const cards = self.selector ? self.selector('.anim-container__list .big-card') : []
          cards.forEach((card: HTMLElement, index: number) => {
            gsap.from(card, {
              yPercent: 10,
              // NOTE: opacity animation is breaking the blur effect on the fitrst cards
              ease: 'power4',
              scrollTrigger: {
                trigger: card,
                start: 'top 80%',
                // end: 'top 10%',
                scrub: true,
                markers: false,
                id: `card-${index + 1}`,
                onEnter: () => paginationItems[index].classList.add('active'),
                onLeaveBack: () => paginationItems[index].classList.remove('active'),
              },
            })
          })
        }, animation.value)
      }

      if (isMobile) {
        ctx = gsap.context((self) => {
          const cards = self.selector ? self.selector('.big-card') : []
          cards.forEach((card: HTMLElement) => {
            gsap.from(card, {
              yPercent: 40,
              opacity: 0,
              ease: 'power4',
              scrollTrigger: {
                trigger: card,
                start: 'top 90%',
                end: 'top center',
                scrub: true,
              },
            })
          })
        }, animation.value)
      }
    },
  )
}

onMounted(() => {
  console.log('mounted')
  animateSection()
})

onUnmounted(() => {
  console.log('unmounted')

  if (ctx) {
    ctx.revert()
  }
})
</script>

<template>
  <div ref="animation">
    <div class="anim-container container">
      <div class="anim-container__pinned-content">
        <h3 class="anim-container__title">
          <span>How can I become a Company agent?</span>
        </h3>
        <div class="anim-container__pagination">
          <span v-for="n in 6" :key="n" class="anim-container__pagination-item">{{ n }}</span>
        </div>
      </div>
      <div class="anim-container__list">
        <div class="cards-list">
          <BigCard />
          <BigCard />
        </div>
        <div class="cards-list">
          <BigCard />
          <BigCard />
        </div>
        <div class="cards-list">
          <BigCard />
          <BigCard />
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.cards-list {
  display: grid;
  gap: 8px;

  @media screen and (min-width: 1024px) {
    grid-template-columns: 1fr 1fr;
    align-items: center;
    justify-items: center;
    gap: 20px;
    min-height: 100vh;

    & > div {
      grid-column: 1/2;
    }
    & > :nth-child(even) {
      margin-top: 250px;
      left: initial;
      grid-column: 2/3;
    }
  }
}

.anim-container {
  outline: 1px solid red;
  position: relative;
  display: grid;
  justify-items: center;
  position: relative;
  overflow-x: clip;
  row-gap: 20px;

  @media screen and (min-width: 1024px) {
    justify-items: initial;
    grid-template-rows: minmax(auto, 100vh) auto minmax(auto, 100vh);
  }
}

.anim-container__list {
  position: relative;
  z-index: 1;
  grid-row: 2/3;
  counter-reset: card;

  & :deep(.big-card) {
    counter-increment: card;

    h3 {
      display: flex;
      align-items: flex-start;

      &::before {
        content: counter(card);
        flex-shrink: 0;
        margin-right: 10px;
        background: var(
          --gradient-heading,
          linear-gradient(101deg, #ffba03 15.82%, #e9d98f 51.56%, #ffba03 85.23%)
        );
        background-clip: text;
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
      }
    }
  }
}

.anim-container__title {
  z-index: 0;
  display: flex;
  flex-direction: column;
  justify-content: center;
  text-align: center;
  color: #ffba03;
  font-weight: 700;
  font-size: 52px;
  line-height: 1.3;
  grid-area: title;
}

.anim-container__pinned-content {
  @media screen and (min-width: 1024px) {
    padding-bottom: 32px;
    height: 100vh;
    position: absolute;
    grid-column: 1/3;
    width: 100%;
    display: grid;
    grid-template-areas:
      '..'
      'title'
      'pagination';
    grid-template-rows: auto 1fr auto;
    gap: 12px;
  }
}

@media screen and (min-width: 1439px) {
  .anim-container__pinned-content {
    padding-inline: 32px;
    grid-template-areas: 'pagination title ...';
    grid-template-columns: auto 1fr auto;
    grid-template-rows: 1fr;
  }
  .anim-container__pagination {
    display: flex;
    flex-direction: column;
  }
}

.anim-container__pagination {
  display: none;

  @media screen and (min-width: 1024px) {
    justify-content: center;
    align-items: center;
    gap: 12px;
    grid-area: pagination;
    display: flex;
  }
}

.anim-container__pagination-item {
  display: flex;
  aspect-ratio: 1;
  line-height: 1;
  align-items: center;
  justify-content: center;
  color: var(--dust-gold-05, rgba(225, 198, 128, 0.5));
  text-align: center;
  border-radius: 8px;
  border: 1px solid var(--dust-gold-05, rgba(225, 198, 128, 0.5));
  padding: 5px 7px;
  font-size: 18px;
  font-weight: 700;
  min-width: 36px;
  transition:
    background 0.3s,
    color 0.3s;

  &.active {
    border: 1px solid var(--yellow, #ffba03);
    background: var(--yellow, #ffba03);
    color: #000;
  }
}
</style>
