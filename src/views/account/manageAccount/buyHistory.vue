<template>
    <div class="container d-md-block d-none">
        <ShowTable :head="tb_head" :body="tb_body" :isdata="isdata">
            <template #btn="{ item }"></template>
        </ShowTable>
    </div>
    <div class="container d-md-none d-block" v-if="typeof tb_body != 'string'">
        <div class="bg-white my-5 tw-rounded-3xl" v-for="(item1 , index1) in tb_body" :key="index1">
            <div class="row g-3 text-center fs-md-4 fs-5 fw-bold" v-for="(item2, index2, key) in item1" :key="index2">
                <div class="col-4 align-self-center py-3">
                    {{ tb_head[key] }}
                </div>
                <div class="col-8 align-self-center py-3">
                    <component :is="index2 == 'img' ? ImgPath : index2 == 'files' ? Btn : 'span'" :data="item2">{{ item2 }}</component>
                </div>
            </div>
        </div>
    </div>
    <div class="container d-md-none d-block" v-else>
        <div class="bg-white my-5 py-5 tw-rounded-3xl">
            <p class="h3 text-center fw-bold">尚無購買紀錄</p>
        </div>
    </div>
</template>

<script setup>
import ShowTable from '@/components/ShowTable.vue';
import { onMounted } from 'vue';
import { shopingAPI, setting  } from '@/assets/JS/function';
import axios from 'axios';
import { storeToRefs } from 'pinia';
import { useAccountStore } from '@/stores/account';
import ImgPath from '@/components/ShowTableComponent/ImgPath.vue';
import Btn from '@/components/ShowTableComponent/Btn.vue';

const { tk } = storeToRefs(useAccountStore());

const tb_head = [ '遊戲名稱','圖片', '檔案', '價格', '付款方式', '購買日期'];
const tb_body = ref({});
const isdata = ref(true);

async function buyShopping () {
    const res = await axios.post(shopingAPI("buyShopping"),{
        "token": `Bearer ${tk.value}`,
    }, setting).catch((err) => {
        console.log(err);
    })
    if (!res) { return; }
    if (res.data.status == 200) {
        isdata.value = true;
        tb_body.value = res.data.data;
    }else{
        isdata.value = false;
        tb_body.value = res.data.message;
    }
    console.log(tb_body.value);
    
}
buyShopping();
</script>

<style lang="scss" scoped>

</style>