<template>
    <div class="container">
        <HeaderMassage :messageData="messageModify('留言回覆')" />

        <ShowTable :head="tb_head" :body="tb_body" :isdata="isdata">
            <template #btn="{ item }">
                <RouterLink :to="`/admin/leaveReply/showMessage?gameId=${item.game_id}`" class="btn btn-primary fs-5 fw-bold me-2">查看</RouterLink>
                <button class="btn btn-danger fs-5 fw-bold me-2" @click="deleteMessage(item.game_id)">刪除</button>
            </template>
        </ShowTable>
    </div>
</template>

<script setup>
import HeaderMassage from '@/components/Admin/HeaderMassage.vue';
import AdminHeadermessage from '@/hook/AdminHeaderMassage';
import ShowTable from '@/components/ShowTable.vue';
import { onMounted, ref } from 'vue';
import axios from 'axios';
import { adminAPI } from '@/assets/JS/function';

const {messageModify } = AdminHeadermessage();

const tb_head = ['遊戲編號', '遊戲圖片', '遊戲名稱', '留言數'];
const tb_body = ref({});
const isdata = ref(true);

onMounted(async () => {
    const res = await axios.get(adminAPI("message", "showAllGameMessage")).catch((err) => {
        console.log(err);
    })
    if(!res) { return; }
    
    if (res.data.status == 200) {
        tb_body.value = res.data.data;
        isdata.value = true;
    }else{
        tb_body.value = res.data.message;
        isdata.value = false;
    }
})
</script>

<style lang="scss" scoped>

</style>