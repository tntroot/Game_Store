<template>
    <div class="container">
        <div class="row">
            <div class="col-12 mt-5">
                <div class="tw-bg-[#123456] p-5 rounded-4 tw-w-fit mx-auto sm:tw-w-[35rem] mt-5">
                    <div class="text-white">
                        <form ref="loginFrom" class="row g-3 needs-validation" novalidate @submit.prevent="loginCheck">
                            <p class="h3 fw-bolder text-center">登入</p>
                            <div class="col-12">
                                <label for="account" class="form-label fs-5">帳號</label>
                                <div class="input-group has-validation">
                                    <span class="input-group-text" id="accountIcon">
                                        <Icon icon="icon-park-outline:people" />
                                    </span>
                                    <input type="text" class="form-control" id="account" name="account"
                                        aria-describedby="accountIcon" v-model="loginData.acc" required />
                                    <div class="invalid-feedback fs-5">帳號不得為空</div>
                                </div>
                            </div>
                            <div class="col-12">
                                <label for="password" class="form-label fs-5">密碼</label>
                                <div class="input-group has-validation">
                                    <span class="input-group-text" id="passwordIcon">
                                        <Icon icon="ph:lock-key-bold" />
                                    </span>
                                    <input type="password" class="form-control" id="password" name="password"
                                        v-model="loginData.pwd" aria-describedby="passwordIcon" autocomplete="off"
                                        required />
                                    <div class="invalid-feedback fs-5">密碼不得為空</div>
                                </div>
                            </div>
                            <div class="col-12 text-center">
                                <p class="fs-5 fw-bold tw-text-red-600">{{ errorText }}</p>
                            </div>
                            <div class="text-center">
                                <button class="btn btn-primary btn-lg fw-bolder my-3" type="submit">
                                    登入
                                </button>
                                <p class="fs-5">
                                    還沒有帳號嗎?
                                    <RouterLink to="/signUp">
                                        <span class="fw-bolder hover:tw-text-[red]">立即註冊</span>
                                    </RouterLink>
                                </p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import axios from 'axios';
import { ref, reactive, toRefs } from 'vue';
import { useRouter } from 'vue-router';
import { getAccountAPI, setting } from '../assets/JS/function';
import { useAccountStore } from '../stores/account';

let router = useRouter();

let loginFrom = ref();
let loginData = reactive({
    acc: '',
    pwd: ''
})
let errorText = ref('');
const accountStore = useAccountStore();
async function loginCheck(event) {
    if (!loginFrom.value.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
    } else {
        let { acc, pwd } = toRefs(loginData);
        const res = await axios.post(getAccountAPI('login'), {
            "account": acc.value,
            "password": pwd.value
        }, setting).catch((err) => {
            console.log(`登入失敗，原因為${err}`);
        })

        if (!res) { return };
        if (res.data.status == 200) {
            accountStore.tk = res.data.data;
            router.push('/');
        } else {
            errorText.value = res.data.message;
        }
    }
    loginFrom.value.classList.add('was-validated')
}
</script>

<style lang="scss" scoped></style>
