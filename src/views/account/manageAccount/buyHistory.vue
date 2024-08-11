<template>
    <div class="container">
        <ShowTable :head="tb_head" :body="tb_body" :isdata="isdata">
            <template #btn="{ item }"></template>
        </ShowTable>
    </div>
</template>

<script setup>
import ShowTable from '@/components/ShowTable.vue';
import { onMounted } from 'vue';
import { shopingAPI, setting  } from '@/assets/JS/function';
import axios from 'axios';
import { storeToRefs } from 'pinia';
import { useAccountStore } from '@/stores/account';

const { tk } = storeToRefs(useAccountStore());

const tb_head = [ '圖片','遊戲名稱', '檔案', '價格', '付款方式', '購買日期'];
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