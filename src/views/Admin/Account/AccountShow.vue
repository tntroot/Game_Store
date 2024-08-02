<template>
    <div class="container">
        <HeaderMassage :messageData="messageModify('帳戶管理')" />

        <ShowTable :head="tb_head" :body="tb_body.data">
            <template #btn="{ item }">

            </template>
        </ShowTable>
    </div>
</template>

<script setup>
import HeaderMassage from '@/components/Admin/HeaderMassage.vue';
import AdminHeadermessage from '@/hook/AdminHeaderMassage';
import ShowTable from '@/components/ShowTable.vue';
import { onMounted, reactive } from 'vue';
import axios from 'axios';

const {messageModify } = AdminHeadermessage();

const tb_head = ['名稱', '帳號', '信箱','電話', '權限', '創建日期'];
const tb_body = reactive({
    data: [
        {
            name: 'wda',
            account: 'wda123',
            email: 'wda123@wda123',
            phone: '0912345678',
            role: 'admin',
            date: '2022/01/01'
        },{
            name: 'wda',
            account: 'wda123',
            email: 'wda123@wda123',
            phone: '0912345678',
            role: 'admin',
            date: '2022/01/01'
        }
    ],
});

onMounted(async() => {
    const res = await axios.get('http://localhost:3000/account');
    tb_body.value = res.data;
})

</script>

<style lang="scss" scoped>

</style>