<template>
    <div class="container">
        <HeaderMassage :messageData="messageModify('遊戲管理')" />
        <div class="text-end mb-4">
            <RouterLink to="/admin/game/addGame" class="btn btn-lg btn-primary me-2 fw-bold">新增遊戲</RouterLink>
        </div>

        <ShowTable :head="tb_head" :body="tb_body" :isdata="isdata">
            <template #btn="{ item }">
                <RouterLink :to="`/admin/game/editGame${item.game_id}`" class="btn btn-primary me-2">
                    修改
                </RouterLink>
                <button class="btn btn-danger" @click="deleteGame(item.game_id)">刪除</button>
            </template>
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
import { useRouter } from 'vue-router';

const { messageModify } = AdminHeadermessage();
const router = useRouter();

const tb_head = ['產品編號', '名稱', '圖片', '價格', '特價','上市日期'];
const tb_body = reactive({});
const isdata = ref(true);

onMounted(() => {
    showGameAPI();
})

async function showGameAPI(){
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
}

async function deleteGame(id) {
    if (confirm('確定要刪除嗎?')) {
        const res = await axios.post(adminAPI('game', 'delGame'), { "game_id": id }, setting).catch((err) => {
            console.log(err);
        })
        if (!res) { return; }
        if (res.data.status == 200) {
            showGameAPI();
        }
    }
}

</script>

<style lang="scss" scoped></style>