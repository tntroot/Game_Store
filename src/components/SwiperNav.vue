<script lang="jsx">
import CardDiv from './CardDiv.vue'
export default {
  props: ['listAll', 'contorl'],
  components: {
    CardDiv
  },
  methods: {
    setSwiper(index) {
      const swiperEl = document.querySelectorAll('swiper-container')[index]

      // swiper parameters
      const swiperParams = {
        direction: 'horizontal', // 方向 vertical 垂直、horizontal 橫向
        navigation: true, // 前後退啟用按鈕
        slidesOffsetAfter: 0, // 與前後退按鈕間隔距離
        slidesOffsetBefore: 0, // 與前後退按鈕間隔距離
        breakpoints: {
          // 響應式
          0: {
            slidesPerView: 1, // 顯示數量
            slidesPerGroup: 1 // 滑動時移動的格數
          },
          400: {
            slidesPerView: 2,
            slidesPerGroup: 1
          },
          750: {
            slidesPerView: 3,
            slidesPerGroup: 2
          },
          100: {
            slidesPerView: 4,
            slidesPerGroup: 3
          },
          1300: {
            slidesPerView: 5,
            slidesPerGroup: 4
          }
        },
        navigation: {
          nextEl: `#next${this.contorl}`,
          prevEl: `#prev${this.contorl}`
        },
        on: {
          // 按件事件
          init() {
            // ...
          }
        }
      }

      // 淺層複製到 swiperEl
      Object.assign(swiperEl, swiperParams)

      // 初始化 swiper
      swiperEl.initialize()
    }
  },
  mounted() {
    // swiper
  }
}
</script>

<template>
  <div class=" position-relative">
    <swiper-container init="false">
      <swiper-slide v-for="(item, index) in listAll" :key="item.id">
        <CardDiv :thisCard="item" />
      </swiper-slide>
    </swiper-container>
    <div :id="'prev' + contorl" class="swiper-button-prev"></div>
    <div :id="'next' + contorl" class="swiper-button-next"></div>
  </div>
</template>

<style lang="scss" scoped>
%swiper-button{
	background: url('../../src/assets/img/emojione--right-arrow.png') no-repeat;
	background-size: 60px;
	width: 60px;
	height: 60px;
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	z-index: 10;
}
.swiper-button-prev {
	@extend %swiper-button;
	transform: translateY(-50%) rotate(180deg) ;
	left: 0;
}
.swiper-button-next {
	@extend %swiper-button;
	right: 0;
}
</style>
