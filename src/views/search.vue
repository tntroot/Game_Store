<template>
    <div class="container">

        <div class="row mt-5 p-5 align-items-center tw-bg-[#dfdfdf]">
            <div class="col-md-8">
                <div class="input-group">
                    <input type="text" class="form-control fs-4" placeholder="輸入遊戲名稱" aria-label="輸入遊戲名稱"
                        aria-describedby="button-addon2" v-model="list.key">
                    <button class="btn btn-outline-secondary" type="button" id="button-addon2" @click="search">
                        <Icon icon="icon-park:search" class="fs-4" />
                    </button>
                </div>
            </div>
            <div class="col-md-4">
                <button class="btn btn-secondary fs-4" type="button" data-bs-toggle="offcanvas"
                    data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
                    <Icon icon="mingcute:settings-2-fill"  class="d-inline-block me-2" />
                    <span class="fw-bolder">篩選條件</span>
                </button>
            </div>
        </div>

        <div class="row mt-5 mb-3">
            <div class="col-12">
                <h3 class="tw-border-b-4 rounded-3 border-primary mb-4">
                    <p class="badge bg-primary rounded-bottom-0 p-3 ms-4 fs-6">查詢結果</p>
                </h3>
                <div>
                    <span class="badge bg-secondary fs-5 m-2 tw-cursor-pointer" v-for="(item, index) in changeList"
                        @click="close(item)" :key="index">{{ item }}
                        <button type="button" class="btn-close btn-close-white" aria-label="Close"></button></span>
                </div>
            </div>
        </div>
        <div class="row row-cols-1 row-cols-sm-2 row-cols-lg-3 row-cols-xl-4 g-4">
            <div class="col" v-for="(item, index) in list" :key="item.id">
                <CardDiv :thisCard="item" />
            </div>
        </div>
    </div>

    <div ref="offcanvas" class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
        <div class="offcanvas-header border-2">
            <p id="offcanvasRightLabel" class="fs-2 fw-bold">篩選器</p>
            <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body p-0">
            <div class="row m-0">
                <div class="col-12 p-0 tw-border-b-2 mb-3">
                    <p class="bg-secondary fs-4 fw-bold text-white p-3">
                       遊戲分類
                    </p>
                    <div class="p-3">
                        <button type="button" class="btn btn-outline-info fs-5 m-2 tw-cursor-pointer" data-bs-toggle="button" 
                            v-for="(item, index) in tagList"
                             :key="index" @click="addOrCloss(item)">
                             <Icon icon="mdi:success-bold" class="d-inline-block me-2" />
                             <span>{{ item }}</span>
                        </button>
                    </div>
                </div>
                <div class="col-6" >
                    <button type="button" class="btn btn-secondary fs-5 w-100" data-bs-dismiss="offcanvas" aria-label="Close">取消</button>
                </div>
                <div class="col-6">
                    <button type="button" class="btn btn-primary fs-5 w-100" data-bs-dismiss="offcanvas" aria-label="Close">搜尋</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { useRoute } from 'vue-router';
import CardDiv from '../components/CardDiv.vue'
import { ref, onMounted, watch } from 'vue';
import { gameAPI, adminAPI } from '@/assets/JS/function';
import axios from 'axios';

let route = useRoute();
let changeList = ref([]);
function close(index) {
    changeList.value = changeList.value.filter((item) => item != index);
}
function resple() {
    changeList.value = [];
    Object.values(route.query).forEach((item, index, values) => {
        if (item) {
            changeList.value.push(item);
        }
    });
}
watch(route, () => {
    resple()
}, { deep: true, immediate: false })

/** 遊戲分類 */
const tagList = ref([]);
/** 篩選 */
const offcanvas = ref();
let list = ref([]);
onMounted(async () => {
    // const urlEl = new URL('../assets/JSON/SearchList.json', import.meta.url)
    // const searchList = await fetch(urlEl).then((res) => res.json())
    const res = await axios.get(gameAPI("showAllGame")).catch((err) => {
        console.log(err);
    })
    if(!res) { return; }
    
    if (res.data.status == 200) {
        list.value = res.data.data;
        resple();
    }else{
        list.value = [];
    }

    const resTag = await axios.get(adminAPI('game', 'showGameType')).catch((err) => {
        console.log(err);
    })
    if(!resTag) { return; }
    if (resTag.data.status == 200) {
        tagList.value = resTag.data.data;
    }

    offcanvas.value.addEventListener('hidden.bs.offcanvas', () => {
        getChangeType.value = [];
        const offcanvasButton = document.querySelectorAll('#offcanvasRight button[data-bs-toggle="button"]');
        offcanvasButton.forEach((item) => {
            item.classList.remove('active');
            item.setAttribute('aria-pressed', 'false');
        })
    })
})

const getChangeType = ref([]);
function addOrCloss(item) {
    if (getChangeType.value.includes(item)) {
        getChangeType.value = getChangeType.value.filter((item1) => item1 != item);
    } else {
        getChangeType.value.push(item);
    }
}
</script>

<style lang="scss" scoped>
.btn-outline-info.active, .btn-outline-info:hover {
    color: white;
}
</style>
