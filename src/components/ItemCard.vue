<script>
import { RouterLink } from 'vue-router';
import { Icon } from '@iconify/vue';
export default {
    props: {
        itemList: {
            type: Object,
            required: true
        }
    },
    components: {
        Icon,
    },
    data() {
        return {

        }
    },
    mounted(){
        
    }
}
</script>
<template>
    <div class="card my-5">
        <div class="row g-0">
            <div class="col-lg-6 bg-black">
                <swiper-container class="mySwiper" thumbs-swiper=".mySwiper2" space-between="10" navigation="true">
                    <swiper-slide v-for="(item, index) in itemList.img" :key="index">
                        <img class="w-100 md:tw-h-[24rem] tw-h-[12rem]" :src="item" alt="" srcset="">
                    </swiper-slide>
                </swiper-container>
                <swiper-container class="mySwiper2" space-between="10" slides-per-view="3" free-mode="true"
                    watch-slides-progress="true">
                    <swiper-slide v-for="(item, index) in itemList.img" :key="index">
                        <img class="w-100 tw-h-[6rem]" :src="item" alt="" srcset="">
                    </swiper-slide>
                </swiper-container>
            </div>
            <div class="col-lg-6">
                <div class="card-body">
                    <h1 class="card-title">{{ itemList.name }}</h1>
                    <table class=" itemTable">
                        <tr>
                            <td>作者：</td>
                            <td>{{ itemList.author }}</td>
                        </tr>
                        <tr>
                            <td>上架時間：</td>
                            <td><small class="text-muted">{{ itemList.update }}</small></td>
                        </tr>
                        <tr>
                            <td>遊戲標籤：</td>
                            <td>
                                <div class="d-flex flex-wrap">
                                    <div
                                        v-for="(item, index) in itemList.gameTag">
                                        <RouterLink to="/">
                                            <span class=" tw-text-blue-600 hover:tw-text-red-600">{{ item }}</span>
                                            <span v-if="itemList.gameTag.length !== index + 1">、</span>
                                        </RouterLink>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                價格：
                            </td>
                            <td>
                                <div class="d-flex align-items-center">
                                    <h5 class="card-text text-danger fw-bolder fs-1 me-2 py-3"> {{ itemList.sale_price != 0 ? `$ ${itemList.sale_price}` :
                                        '免費' }}</h5>
                                    <h5 v-if="itemList.sale_price != itemList.price" class="text-decoration-line-through">${{ itemList.price }}</h5>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <div class="btn btn-lg btn-outline-dark mt-3 fw-bolder mx-auto d-block">
                        <Icon icon="typcn:shopping-cart" class=" d-inline-block me-2" />
                        <span>加入購物車</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<style lang="scss" scoped>
.mySwiper2 {
    padding: 0.8rem;
    background-color: rgba(0, 0, 0, 0.911);

    img {
        cursor: pointer;
    }
}

.card-title {
    border-bottom: 0.3rem solid #00d9ff;
    padding-bottom: 1rem;
}

.itemTable {
    font-size: 1rem;
    table-layout: fixed;
    width: 100%;

    tr>td:nth-child(1) {
        padding: 0.3rem 0;
        width: 100px;
    }

    @media screen and (min-width: 600px) {
        font-size: 1.5rem;
        & > tr>td:nth-child(1) {
            padding: 0.3rem 0;
            width: 150px;
        }
    }
}</style>