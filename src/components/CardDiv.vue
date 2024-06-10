<script setup>
import { RouterLink } from 'vue-router';
import { computed, onMounted } from 'vue'
let propsThisCard = defineProps(['thisCard']);
let salePrice = computed(() => {
    return propsThisCard.thisCard.price > propsThisCard.thisCard.sale_price;
})
onMounted(() => {
    propsThisCard.thisCard.img[0] = new URL(`../assets/img/${propsThisCard.thisCard.img[0]}`, import.meta.url);
    if(typeof propsThisCard.thisCard.price !== 'string'){
        propsThisCard.thisCard.price = new Intl.NumberFormat('en').format(propsThisCard.thisCard.price);
        propsThisCard.thisCard.sale_price = new Intl.NumberFormat('en').format(propsThisCard.thisCard.sale_price);
        propsThisCard.thisCard.sales = new Intl.NumberFormat('en').format(propsThisCard.thisCard.sales);
    }
})
</script>
<template>
    <div class="card p-0 border-0 mx-2">
        <!-- :to="{part: '/item', query: { userID : thisCard.id }}" -->
        <RouterLink :to="'/search/item?userId=' + thisCard.id">
            <div v-if="salePrice" class="badge sales">
                特價
            </div>
            <img :src="thisCard.img[0]" class="card-img-top w-100 tw-h-48" :alt="thisCard.name">
        </RouterLink> 
        <div class="card-body">
            <RouterLink :to="'/search/item?userId=' + thisCard.id">
                <h5 class="card-title fs-5 tw-text-[#3640ac] hover:tw-text-red-600 tw-line-clamp-2">{{ thisCard.name }}</h5>
            </RouterLink>
            <div class="d-flex align-items-center">
                <h5 class="card-text text-danger fw-bolder fs-5 me-2"> {{ thisCard.sale_price!=0 ? `$ ${thisCard.sale_price}` :
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
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal1">
                    <Icon icon="typcn:shopping-cart" class=" d-inline-block me-2" />
                    <span>加入購物車</span>
                </button>
            </div>
        </div>
    </div>
</template>
<style lang="scss" scoped>
 .sales {
    background-color: rgb(255, 50, 50);
    position: absolute;
    top: 0.5rem;
    right: 0.5rem;
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