<template>
    <div class="container">
        <HeaderMassage :messageData="messageModify('帳戶管理')" />

        <ShowTable :head="tb_head" :body="tb_body">
            <template #btn="{ item }">
                <RouterLink :to="`/admin/account/show${item.account}`" class="btn btn-primary me-2">
                    修改權限
                </RouterLink>
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
import { adminAPI, setting } from "@/assets/JS/function.js";
import { RouterLink } from 'vue-router';

const {messageModify } = AdminHeadermessage();

const tb_head = ['編號','名稱', '帳號', '信箱','電話', '權限', '創建日期'];
const tb_body = reactive({});

async function getAccount() {
    await axios.get(adminAPI('account', 'showAccount')).then((res) => {
        let data = res.data.data;
        // 替換權限
        let data_map = data.map((item) => {
            item.permission = item.permission == 0 ? '管理員' : '會員';
            item.phone = item.phone ? item.phone : '暫無';
            return item;
        });
        tb_body.value = data_map;
    }).catch((err) => {
        console.log(err);
    });
    console.log(tb_body.value);
    
}
getAccount();

</script>

<style lang="scss" scoped>

</style>