<template>
    <div class="container">
        <HeaderMassage :messageData="messageModify('帳戶管理')" />

        <div class="row justify-content-center">
            <div class="col-xxl-6 col-lg-8">
                <form class="row g-3 needs-validation justify-content-center bg-white p-5 fs-4 fw-bold" novalidate @submit.prevent="editAccountPermission">
                    <div class="mb-3 row">
                        <div class="col-md-2">暱稱: </div>
                        <div class="col-md-10">{{ account.name }}</div>
                    </div>
                    <div class="mb-3 row">
                        <div class="col-md-2">帳號: </div>
                        <div class="col-md-10">{{ account.account }}</div>
                    </div>
                    <div class="mb-3 row">
                        <div class="col-md-2">Email: </div>
                        <div class="col-md-10">{{ account.email }}</div>
                    </div>
                    <div class="mb-3 row">
                        <div class="col-md-2">性別: </div>
                        <div class="col-md-10">{{ account.sex }}</div>
                    </div>
                    <div class="mb-3 row">
                        <div class="col-md-2">生日: </div>
                        <div class="col-md-10">{{ account.birthday }}</div>
                    </div>
                    <div class="mb-3 row">
                        <div class="col-md-2">電話: </div>
                        <div class="col-md-10">{{ account.phone }}</div>
                    </div>
                    <div class="mb-3 row">
                        <div class="col-md-2">權限: </div>
                        <div class="col-sm-10">
                            <input type="radio" name="member" id="member0" value="0" class="form-check-input me-2" v-model="account.permission">
                            <label for="member0" class="form-check-label me-4 tw-cursor-pointer">管理員</label>
                            <input type="radio" name="member" id="member2" value="2" class="form-check-input me-2" v-model="account.permission">
                            <label for="member2" class="form-check-label me-2 tw-cursor-pointer">會員</label>
                        </div>
                    </div>
                    <div class="col text-center">
                        <router-link to="/admin/account/accountShow" class="btn btn-info btn-lg me-4">返回</router-link>
                        <button type="submit" class="btn btn-primary btn-lg">確認修改</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</template>

<script setup>
import HeaderMassage from '@/components/Admin/HeaderMassage.vue';
import AdminHeadermessage from '@/hook/AdminHeaderMassage';
import axios from 'axios';
import { onMounted, reactive, toRefs } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import { getAccountAPI, adminAPI, setting } from '@/assets/JS/function.js';
const { messageModify } = AdminHeadermessage();

const route = useRoute();
const router = useRouter();

function editAccountPermission() {
    // const {account} = toRefs(accountData);

    axios.post(adminAPI('account','editAccountPermission'), { "user_id": account.value.user_id, "permission": account.value.permission}, setting).then((res) => {
        if(res.data.status == 200) {
            router.push('/admin/account/accountShow');
        }
    }).catch((err) => {
        console.log(err);
    })
}

/** 帳號資料 */
const accountData = reactive({
    account: '',
});
const { account } = toRefs(accountData);
onMounted(async() => {
    const id = route.params.id;
    
    const res = await axios.post(getAccountAPI('getUser'), { "account": id}, setting).catch((err) => {
        console.log(err);
    })

    if(!res) { router.push('/admin/account/accountShow'); };

    const { status, data} = res.data;
    if(status == 200) {
        account.value = {
            ...data,
            sex: data.sex == 0 ? '男' : data.sex == 1 ? '女' : '不透漏', 
            phone: data.phone ? data.phone : '暫無',
        };
    }else{
        router.push('/admin/account/accountShow');
    }
})
</script>

<style lang="scss" scoped></style>