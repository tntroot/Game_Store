<script setup>
import { computed } from 'vue'

const props = defineProps(['shopping', 'activeView']);
let allPrice = computed(() => {
    return props.shopping.reduce((sum, item) => sum + item.sale_price, 0)
})

function download() {
    window.open("https://drive.usercontent.google.com/download?id=16OgydLXTIWOOZeFUQIAAbT9kih0PaUED&export=download&authuser=0&confirm=t&uuid=81ca6b2a-16d5-4b89-8bf2-e9004613142e&at=APZUnTUu2jkwglH_ZP7GTAnBNAlw%3A1718560118281");
}


</script>

<template>
    <h3 class="tw-border-b-4 rounded-3 border-primary mb-4">
        <p class="badge bg-primary rounded-bottom-0 p-3 fs-6">購買遊戲</p>
    </h3>
    <div class="px-2">
        <div class="rounded-3 bg-white">
            <div class="row border-all mx-0" v-for="item in props.shopping" :key="item.id">
                <div class="col-md-3 col-4 d-flex-xy-center">
                    <img class="tw-h-[6rem]" src="@/assets/img/gta/gta_home.jpg" alt="" srcset="" />
                </div>
                <div class="col-md-9 col-8">
                    <div class="row h-100">
                        <div class="col-md-9">
                            <p class="md:tw-text-xl tw-font-bold tw-line-clamp-2">
                                {{ item.name + ' 123 ' + item.name + item.name + item.name + item.name }}
                            </p>
                        </div>
                        <div class="col-md-3 d-flex-xy-center">
                            <button class="btn btn-color px-4" v-if="props.activeView" @click="download">
                                <Icon class="d-inline-block fw-bolder" icon="line-md:download-outline-loop" />
                                <span class="fw-bolder">下載</span>
                            </button>
                            <h3 class="card-text tw-text-red-600 fw-bolder" v-else>
                                {{ item.sale_price != 0 ? `NT$ ${item.sale_price}` : '免費' }}
                            </h3>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" v-if="!props.activeView">
                <div class="col-12 text-end px-5 py-4">
                    <h3 class="tw-font-bold tw-text-2xl">總計:　<span class="tw-text-red-600">NT$ {{ allPrice }}</span></h3>
                </div>
            </div>
        </div>
    </div>
</template>

<style lang="scss" scoped>
@import '@/assets/SASS/repeat';

.border-all {
    $border: 1px solid #8f8f8f;
    padding: 1rem;
    border-bottom: $border
}

.btn {
    &-hover {
        @include btn-onClick();
    }

    &-color {
        @include btn-onClick(rgb(0, 179, 255));
    }
}
</style>
