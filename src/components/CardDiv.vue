<script>
    import { RouterLink } from 'vue-router';
    import { Icon } from '@iconify/vue';
    export default {
        props: ['thisCard'],
        components:{
            Icon, 
        },
        data() {
            return {

            }
        },
        created() {
            this.thisCard.img = new URL(this.thisCard.img, import.meta.url);
        },
    }
</script>
<template>
    <div class="card p-0 border-0 mx-2">
        <img :src="thisCard.img" class="card-img-top w-100 tw-h-48" :alt="thisCard.name">
        <div class="card-body">
            <h5 class="card-title fw-bolder fs-5 tw-text-[#3640ac]">{{ thisCard.name }}</h5>
            <h5 class="card-text text-danger fw-bolder fs-5">$ {{ thisCard.price }}</h5>
            <p class="tw-text-[gray] mt-2">銷量: {{ thisCard.scale }}</p>
            <div class="d-flex align-items-center">
                <div class="ratings fs-4 me-3">
                    <div>★★★★★</div>
                    <div class="full_star" :style="'width:'+thisCard.rating*20+'%'">★★★★★</div>
                </div>
                <div class="d-flex align-items-center fs-6">
                    <Icon icon="icon-park:message-emoji" class="me-1" />
                    <span>{{ " " + thisCard.message }}</span>
                </div>
            </div>

        </div>
    </div>
</template>
<style lang="scss" scoped>
    
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
    }

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
</style>