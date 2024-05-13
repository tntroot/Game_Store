<script>
import { RouterLink } from 'vue-router';
import { Icon } from '@iconify/vue';
export default {
    props: ['thisCard'],
    components: {
        Icon,
    },
    data() {
        return {

        }
    },
    computed: {
        salePrice() {
            return this.thisCard.price > this.thisCard.sale_price;
        }
    },
    created() {
        this.thisCard.img = new URL(this.thisCard.img, import.meta.url);
    },
}
</script>
<template>
    <div class="card p-0 border-0 mx-2">
        <div v-if="salePrice" class="badge sales" style="top: 0.5rem; right: 0.5rem">
            特價
        </div>
        <img :src="thisCard.img" class="card-img-top w-100 tw-h-48 thisCard" :alt="thisCard.name">
        <div class="card-body">
            <h5 class="card-title fw-bolder fs-5 tw-text-[#3640ac]">{{ thisCard.name }}</h5>
            <div class="d-flex align-items-center">
                <h5 class="card-text text-danger fw-bolder fs-5 me-2"> {{ thisCard.sale_price ? `$ ${thisCard.sale_price}` :
                    '免費' }}</h5>
                <h5 v-if="salePrice" class="text-decoration-line-through">${{ thisCard.price }}</h5>
            </div>

            <p class="tw-text-[gray] mt-2">銷量: {{ thisCard.sales }}</p>
            <div class="d-flex align-items-center">
                <div class="ratings fs-4 me-3">
                    <div>★★★★★</div>
                    <div class="full_star" :style="'width:' + thisCard.rating * 20 + '%'">★★★★★</div>
                </div>
                <div class="d-flex align-items-center fs-6">
                    <Icon icon="icon-park:message-emoji" class="me-1" />
                    <span>{{ " " + thisCard.message }}</span>
                </div>
            </div>
            <div class="text-center">
                <a class="btn btn-outline-dark mt-3" href="#">加入購物車</a>
            </div>
        </div>
    </div>
</template>
<style lang="scss" scoped>
.sales {
    background-color: rgb(255, 50, 50);
    position: absolute;
    top: 0.5rem
        /* 8px */
    ;
    right: 0.5rem
        /* 8px */
    ;
    color: white;
    font-size: 1rem;
    padding: 0.5rem 1rem;
    font-weight: bolder;
}

.ratings {
    position: relative;
    vertical-align: middle;
    display: inline-block;
    color: #a2a2a2;
    /*背景星星顏色*/
    overflow: hidden;
    /*  調整字體大小可放大縮小星星 */
    /* font-size: 2.5rem; */
    text-shadow: 0px 1px 0 #999;

    .full_star {
        /*調整寬度可變更星等*/
        position: absolute;
        left: 0;
        top: 0;
        white-space: nowrap;
        overflow: hidden;
        color: #ffd500;
        /*前景星星顏色*/
    }
}
</style>