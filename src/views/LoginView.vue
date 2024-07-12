<script setup>
import axios from 'axios';
import { ref, reactive, toRefs } from 'vue';

import { getAccountAPI, setting } from '../assets/JS/function';

let loginFrom = ref();
let loginData = reactive({
    acc: '',
    pwd: ''
})
function loginCheck(event) {
    if (!loginFrom.value.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
    } else {
        let { acc, pwd } = toRefs(loginData);
        axios.post(getAccountAPI('login'), {
            "account": acc.value,
            "password": pwd.value
        }, setting).then((res) => {
            console.log(res);
            localStorage.setItem('token', res.data.token);
        }).catch((err) => {
            console.log(`登入失敗，原因為${err}`);
        })


    }
    loginFrom.value.classList.add('was-validated')
}
function loginAPI(){
    axios.post(getAccountAPI('checkAccount'), {
        header:{
            'Content-Type': 'application/x-www-form-urlencoded',
            'Authorization': `${localStorage.getItem('token')}`
        }
    })
    .then((res) => {
        console.log(res);
    }).catch((err) => {
        console.log(`驗證失敗，原因為${err}`);
    })
}
</script>

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
                                        v-model="loginData.pwd" aria-describedby="passwordIcon" autocomplete="off" />
                                    <div class="invalid-feedback fs-5">密碼不得為空</div>
                                </div>
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
                                <button class="btn btn-primary" type="button" @click="loginAPI">
                                    驗證登入
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<style lang="scss" scoped></style>
