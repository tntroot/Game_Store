<script setup>
import SwiperNav from '../components/SwiperNav.vue'
import { ref, onMounted } from "vue"

let swiperDiv1 = ref();
    let swiperDiv2 = ref();
    let swiperDiv3 = ref();
function setSwiper() {
    swiperDiv1.value.setSwiper(0);
    swiperDiv2.value.setSwiper(1);
    swiperDiv3.value.setSwiper(2);
}

let list1 = ref([]);
let list2 = ref([]);
let list3 = ref([]);
onMounted( async() => {
    const urlEl = new URL('../assets/JSON/ProductList.json', import.meta.url);
    const thisListAll = await fetch(urlEl).then((res) => res.json());

    list1.value = thisListAll.list1;
    list2.value = thisListAll.list2;
    list3.value = thisListAll.list3;

    setSwiper();
})
</script>

<template>
  <header class="bg-dark px-5 tw-py-[3rem] sm:tw-py-[6rem] text-center">
    <h1 class="tw-text-4xl sm:tw-text-6xl fw-bolder tw-text-[#1efce6]">夢幻宇宙網</h1>
    <p class="tw-text-2xl sm:tw-text-5xl lead fw-bolder tw-text-white mb-0 mt-2">
      你想玩的遊戲都在這裡
    </p>
  </header>
  <div class="container">
    <div class="row my-4">
      <h3 class="tw-border-b-4 rounded-3 border-primary mb-4">
        <p class="badge bg-primary rounded-bottom-0 p-3 fs-6">最新遊戲</p>
      </h3>

      <SwiperNav ref="swiperDiv1" :listAll="list1" :contorl="0" />
    </div>
    <div class="row my-4">
      <h3 class="tw-border-b-4 rounded-3 border-danger mb-4">
        <p class="badge bg-danger rounded-bottom-0 p-3 fs-6">促銷遊戲</p>
      </h3>

      <SwiperNav ref="swiperDiv2" :listAll="list2" :contorl="1" />
    </div>
    <div class="row my-4">
      <h3 class="tw-border-b-4 rounded-3 border-info mb-4">
        <p class="badge bg-info rounded-bottom-0 p-3 fs-6">人氣遊戲</p>
      </h3>

      <SwiperNav ref="swiperDiv3" :listAll="list3" :contorl="2" />
    </div>
  </div>
</template>

<style lang="scss" scoped>
header {
  background: url('../assets/img/advertise.jpg');
  background-position: 0 40%;
  background-size: 100%;
  text-shadow: 4px 3px 1px purple, -3px -1px 1px purple;
}
</style>