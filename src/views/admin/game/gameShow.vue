<template>
    <div class="container">
        <HeaderMassage :messageData="messageModify('遊戲管理')" />
        <div class="text-end mb-4">
            <RouterLink to="/admin/game/addGame" class="btn btn-lg btn-primary me-2 fw-bold">新增遊戲</RouterLink>
        </div>

        <ShowTable :head="tb_head" :body="tb_body" :isdata="isdata">
            <!-- <template #btn="{ item }">
                <RouterLink :to="`/admin/game/show${item.gameID}`" class="btn btn-primary me-2">
                    修改遊戲
                </RouterLink>
            </template> -->
        </ShowTable>
    </div>
</template>

<script setup>
import HeaderMassage from '@/components/Admin/HeaderMassage.vue';
import AdminHeadermessage from '@/hook/AdminHeaderMassage';
import ShowTable from '@/components/ShowTable.vue';
import { onMounted, reactive, ref } from 'vue';
import axios from 'axios';
import { adminAPI, setting } from "@/assets/JS/function.js";

const { messageModify } = AdminHeadermessage();

const tb_head = ['編號', '名稱', '圖片', '作者','價格','上市日期'];
const tb_body = reactive({});
const isdata = ref(true);

onMounted(async () => {
    const res = await axios.get(adminAPI('game', 'showGame')).catch((err) => {
        console.log(err);
    })
    if (!res) { 
        isdata.value = false;
        tb_body.value = "查無資料";
        return; 
    }
    if (res.data.status == 200) {
        isdata.value = true;
        tb_body.value = res.data.data;
    } else {
        isdata.value = false;
        tb_body.value = res.data.message;
    }
})

</script>

<style lang="scss" scoped></style>