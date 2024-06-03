<script>
import { RouterLink } from 'vue-router'
export default {
    data() {
        return {
            shopping: [
                {
                    id: 1,
                    name: '冰與火之舞',
                    price: 123,
                    sale_price: 0
                },
                {
                    id: 2,
                    name: '幻塔',
                    price: 123,
                    sale_price: 120
                },
                {
                    id: 3,
                    name: 'Minecraft',
                    price: 123,
                    sale_price: 100
                }
            ]
        }
    },
    methods: {
        deleteShop(id) {
            this.shopping = this.shopping.filter((item) => item.id !== id);
            let as = "this-add";
            console.log(as.split("_").at(0));
        }
    },
    computed: {
        allPrice() {
            return this.shopping.reduce((sum, item) => sum + item.sale_price, 0)
        }
    }
}
</script>

<template>
    <div class="container">
        <p class="h2 text-white fw-bolder my-5">你的購物車</p>
        <div class="row" v-if="shopping.length">
            <div class="col-lg-9">
                <div class="tw-bg-[#123c66] rounded-4 mb-5" v-for="item in shopping" :key="item.id">
                    <div class="d-flex w-100 tw-text-[white]">
                        <img src="../assets/img/A_Dance_of_Fire_and_Ice/A Dance of Fire and Ice_home.jpg"
                            class="md:tw-w-[12rem] tw-w-1/4 tw-h-[8rem]" alt="" srcset="" />
                        <div class="tw-font-bold ps-4 pt-3 w-100">
                            <p class="md:tw-text-2xl tw-font-bold tw-line-clamp-2">{{ item.name + " 123 " +  item.name + item.name + item.name +item.name }}</p>
                            <div class="d-flex pe-4 align-items-center justify-content-between">
                                <div class="my-4 d-md-flex d-block">
                                    <h3 v-if="item.price > item.sale_price"
                                        class="text-decoration-line-through tw-text-[#777777]">{{ `NT$ ${item.price}` }}
                                    </h3>
                                    <h3 class="card-text tw-text-red-600 fw-bolder fs-5 ms-md-2 text-center">
                                        {{ item.sale_price != 0 ? `NT$ ${item.sale_price}` : '免費' }}
                                    </h3>
                                </div>
                                <button class="btn btn-danger p-3" type="button" @click="deleteShop(item.id)">
                                    <Icon icon="wpf:delete" />
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 px-5">
                <div class="p-4 tw-bg-[#123456] rounded-4">
                    <div class="text-center text-white">
                        <p class="h3 fw-bolder">總計</p>
                        <p class="h3 fw-bolder">NT$ {{ allPrice }}</p>
                        <button class="btn btn-primary btn-lg fw-bolder my-3" type="button">確認結帳</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="row my-5" v-else>
            <div class="col-12">
                <div class="border-2 border-black rounded-4 text-center p-5">
                    <p class="h3 text-center text-white fw-bolder">空空如也</p>
                    <p class="h3 text-center text-white fw-bolder">快去選購吧！</p>
                    <RouterLink to="/search">
                        <button class="btn btn-primary btn-lg fw-bolder my-3" type="button">前往選購</button>
                    </RouterLink>
                </div>
            </div>
        </div>
    </div>
</template>

<style lang="scss" scoped></style>
