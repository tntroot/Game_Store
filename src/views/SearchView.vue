<script setup>
import { useRoute } from 'vue-router';
import CardDiv from '../components/CardDiv.vue'
import { ref, onMounted, watch } from 'vue';

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


let list = ref([]);
onMounted(async () => {
    const urlEl = new URL('../assets/JSON/SearchList.json', import.meta.url)
    const searchList = await fetch(urlEl).then((res) => res.json())

    list.value = searchList
    resple()
})
</script>

<template>
    <div class="container">
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
            <div class="col" v-for="(item, index) in list.search" :key="item.id">
                <CardDiv :thisCard="item" />
            </div>
        </div>
    </div>
</template>

<style lang="scss" scoped></style>
