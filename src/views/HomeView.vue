<script>
import SwiperNav from '../components/SwiperNav.vue'
export default {
  components: {
    SwiperNav,
  },
  data() {
    return {
      list1: [],
      list2: [],
      list3: [],
    }
  },
  methods:{
	setSwiper(){
		this.$refs.swiperDiv1.setSwiper(0);
		this.$refs.swiperDiv2.setSwiper(1);
		this.$refs.swiperDiv3.setSwiper(2);
	}
  },
  async created() {
    const urlEl = new URL('../assets/JSON/ProductList.json', import.meta.url);
    const thisListAll = await fetch(urlEl).then((res) => res.json());

    this.list1 = thisListAll.list1
    this.list2 = thisListAll.list2
    this.list3 = thisListAll.list3;

	this.setSwiper();
  },
}
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