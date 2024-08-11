<template>
    <div class="container">
        <HeaderMassage :messageData="messageModify('帳戶管理')" />

        <ShowTable :head="tb_head" :body="tb_body" :isdata="isdata">
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
import { onMounted, reactive, ref } from 'vue';
import axios from 'axios';
import { adminAPI, setting } from "@/assets/JS/function.js";
import { RouterLink } from 'vue-router';

const {messageModify } = AdminHeadermessage();

const tb_head = ['編號','名稱', '帳號', '信箱','電話', '權限', '創建日期'];
const tb_body = ref({});
const isdata = ref(true);

async function getAccount() {
    await axios.get(adminAPI('account', 'showAccount')).then((res) => {
        let data = res.data.data;

        if(res.data.status == 200){
            // 替換權限
            let data_map = data.map((item) => {
                item.permission = item.permission == 0 ? '管理員' : '會員';
                item.phone = item.phone ? item.phone : '暫無';
                return item;
            });
            isdata.value = true;
            tb_body.value = data_map;
        }else{
            isdata.value = false;
            tb_body.value = data;
        }
        
    }).catch((err) => {
        isdata.value = false;
        tb_body.value = '查無資料';
        console.log(err);
        return; 
    }); 
}
getAccount();

</script>

<style lang="scss" scoped>

</style>