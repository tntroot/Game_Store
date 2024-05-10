<script lang="jsx">
import CardDiv from './CardDiv.vue'
import { Icon } from '@iconify/vue'
export default {
  props: ['listAll'],
  components: {
    CardDiv,
    Icon
  },
  methods: {
    setBtn(index) {
      const swiper_container = document.querySelectorAll('swiper-container')[index]
      const prevBtn = swiper_container.shadowRoot.querySelector('.swiper-button-prev')
      const nextBtn = swiper_container.shadowRoot.querySelector('.swiper-button-next')
      prevBtn.innerHTML = `<img src='../../src/assets/img/emojione--right-arrow.png' style='transform: rotate(180deg);' width='60'>`
      nextBtn.innerHTML = `<img src='../../src/assets/img/emojione--right-arrow.png' width='60'>`
    },
    setSwiper(index) {
      const swiperEl = document.querySelectorAll('swiper-container')[index];

      // swiper parameters
      const swiperParams = {
        direction: 'horizontal', // 方向 vertical 垂直、horizontal 橫向
        navigation: true, // 前後退啟用按鈕
        slidesOffsetAfter : 0, // 與前後退按鈕間隔距離
        slidesOffsetBefore : 0, // 與前後退按鈕間隔距離
        breakpoints: {  // 響應式
          0: {
            slidesPerView: 1, // 顯示數量
            slidesPerGroup: 1, // 滑動時移動的格數
          },
          400: {
            slidesPerView: 2,
            slidesPerGroup: 1,
          },
          750: {
            slidesPerView: 3,
            slidesPerGroup: 2,
          },
          100: {
            slidesPerView: 4,
            slidesPerGroup: 3,
          },
          1300: {
            slidesPerView: 5,
            slidesPerGroup: 4,
          }
        },
        on: { // 按件事件
          init() {
            // ...
          }
        }
      }

      // 淺層複製到 swiperEl
      Object.assign(swiperEl, swiperParams);

      // 初始化 swiper
      swiperEl.initialize();
    }
  },
  mounted() {
    // swiper 
  }
}
</script>

<template>
  <swiper-container init="false">
    <swiper-slide v-for="(item, index) in listAll" :key="item.id">
      <CardDiv :thisCard="item" />
    </swiper-slide>
  </swiper-container>
</template>

<style lang="scss" scoped>

</style>
