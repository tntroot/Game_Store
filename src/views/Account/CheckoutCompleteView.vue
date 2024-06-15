<script setup>
import { ref } from 'vue';

let shopping = ref('');
shopping.value = [
    {
        id: 1,
        name: '冰與火之舞',
        zip: "",
    },
    {
        id: 2,
        name: '幻塔',
        zip: "",
    },
    {
        id: 3,
        name: 'Minecraft',
        zip: "",
    }
];
</script>

<template>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="text-center p-5 text-center text-white">
                    <p class="h2 fw-bolder">購買成功</p>
                    <p class="h4 fw-bolder">遊戲已加入到你的帳戶，你隨時可以進行下載</p>
                    <button type="button" class=""></button>
                </div>
            </div>
            <h3 class="tw-border-b-4 rounded-3 border-primary mb-4">
                <p class="badge bg-primary rounded-bottom-0 p-3 fs-6">購買遊戲</p>
            </h3>
            <div class="rounded-4 bg-white">
                <div class="row border-all" v-for="item in shopping" :key="item.id">
                    <div class="col-3">
                        <img src="../../assets/img/gta/gta_home.jpg" alt="" srcset="">
                    </div>
                    <div class="col-7">
                        <p class="md:tw-text-2xl tw-font-bold tw-line-clamp-2">{{ item.name + " 123 " + item.name +
                            item.name + item.name + item.name }}</p>
                    </div>
                    <div class="col-2 d-flex-xy-center">
                        <button type="button" class="btn btn-lg ">
                            <Icon class=" d-inline-block fw-bolder" icon="line-md:download-outline-loop" />
                            <span class="fw-bolder">下載</span>
                        </button>
                    </div>
                </div>
            </div>

        </div>
    </div>
</template>

<style lang="scss" scoped>
@import "../../assets/SASS/repeat";
.border-all {
    $border: 1px solid #8f8f8f;

    &>div {
        border: $border;
        padding: 1rem;

        &:first-of-type {
            border-left: 0;
        }

        &:last-of-type {
            border-right: 0;
        }
    }

    &:first-of-type {
        div {
            border-top: 0;
        }
    }

    &:last-of-type {
        div {
            border-bottom: 0;
        }
    }
}

.btn{
    $color: #41d5fa;
    background-color: $color;
    @include btn-onClick($color)
}
</style>