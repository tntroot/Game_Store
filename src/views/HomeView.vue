<script>
    import CardDiv from "../components/CardDiv.vue";
    export default {
        components: {
            CardDiv,
        },
        data() {
            return {
                list: [{
                    id: 1, name: "Minecraft", img: "../assets/img/minecraft.webp", price: 1000,sale_price: 1000, rating: 3.7, sales: 100000, message: 123,
                }, {
                    id: 2, name: "asd", img: "../assets/img/minecraft.webp", price: 1000, sale_price: 850, rating: 3.7, sales: 100000, message: 123,
                }, {
                    id: 3, name: "xxcc", img: "../assets/img/minecraft.webp", price: 1000, sale_price: 789, rating: 3.7, sales: 100000, message: 123,
                }, {
                    id: 4, name: "aadscc", img: "../assets/img/minecraft.webp", price: 1000, sale_price: 1000, rating: 3.7, sales: 100000, message: 123,
                }, {
                    id: 5, name: "wweqe", img: "../assets/img/minecraft.webp", price: 1000, sale_price: 865, rating: 3.7, sales: 100000, message: 123,
                }, {
                    id: 6, name: "hjfrr", img: "../assets/img/minecraft.webp", price: 1000, sale_price: 1000, rating: 3.7, sales: 100000, message: 123,
                },],
                mySwiper: {
                    direction: "vertical", // 方向
                    loop: false,  // 循環,
                    slidesPerView: 1,  // 顯示個數，一組要顯示幾個
                    navigation: {
                        prev: ".swiper-button-prev",
                        next: ".swiper-button-next"
                    }, // 控制按鈕
                    breakpoints: {  // 響應式
                        400: { slidesPerView: 2,},
                        750: { slidesPerView: 3,},
                        1024: { slidesPerView: 4,},
                        1300: { slidesPerView: 5,},
                    },
                    on: {
                        init() {
                            // ...
                        },
                    },
                }
            }
        },
    }
</script>

<template>
    <header class="bg-dark px-5 tw-py-[3rem] sm:tw-py-[6rem] text-center">
        <h1 class="tw-text-4xl sm:tw-text-6xl fw-bolder tw-text-[#1efce6]">夢幻宇宙網</h1>
        <p class="tw-text-2xl sm:tw-text-5xl lead fw-bolder tw-text-white mb-0 mt-2">你想玩的遊戲都在這裡</p>
    </header>
    <div class="container">
        <div class="row my-4">
            <h3 class="tw-border-b-4 rounded-3 border-primary mb-4">
                <p class="badge bg-primary rounded-bottom-0 p-3 fs-6">最新遊戲</p>
            </h3>

            <swiper-container :slidesPerView="mySwiper.slidesPerView" :navigation="mySwiper.navigation" :loop="mySwiper.loop" :breakpoints="mySwiper.breakpoints">
                <swiper-slide v-for="(item, index) in list" :key="item.id">
                    <CardDiv :thisCard="item" />
                </swiper-slide>

                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </swiper-container>
        </div>
        <div class="row my-4">
            <h3 class="tw-border-b-4 rounded-3 border-danger mb-4">
                <p class="badge bg-danger rounded-bottom-0 p-3 fs-6">促銷遊戲</p>
            </h3>

            <swiper-container :slidesPerView="mySwiper.slidesPerView" :navigation="mySwiper.navigation" :loop="mySwiper.loop" :breakpoints="mySwiper.breakpoints">
                <swiper-slide v-for="(item, index) in list" :key="item.id">
                    <CardDiv :thisCard="item" />
                </swiper-slide>

                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </swiper-container>
        </div>
        <div class="row my-4">
            <h3 class="tw-border-b-4 rounded-3 border-info mb-4">
                <p class="badge bg-info rounded-bottom-0 p-3 fs-6">人氣遊戲</p>
            </h3>

            <swiper-container :slidesPerView="mySwiper.slidesPerView" :navigation="mySwiper.navigation" :loop="mySwiper.loop" :breakpoints="mySwiper.breakpoints">
                <swiper-slide v-for="(item, index) in list" :key="item.id">
                    <CardDiv :thisCard="item" />
                </swiper-slide>

                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </swiper-container>
        </div>
    </div>
</template>

<style lang="scss" scoped>
    header {
        background: url("../assets/img/advertise.jpg");
        background-position: 0 40%;
        background-size: 100%;
        text-shadow: 4px 3px 1px purple, -3px -1px 1px purple;
    }
    .swiper-button-prev, .swiper-button-next{
        background-color: gray;
        padding: 1rem 0.5rem;
    }
</style>