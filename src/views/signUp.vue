<template>
    <div class="container">
        <div class="row">
            <div class="col-12 mt-5">
                <div class="tw-bg-[#123456] pb-4 px-5 rounded-4 tw-w-fit mx-auto sm:tw-w-[35rem] mt-5 text-white">
                    <p class="h1 fw-bolder text-center py-5">歡迎註冊！</p>
                    <form class="row g-3 needs-validation" ref="signUpForm" novalidate @submit.prevent="signUpCheck">
                        <div class="col-md-6">
                            <label for="username" class="form-label fs-5">暱稱</label>
                            <div class=" input-group has-validation">
                                <span class="input-group-text bg-danger" id="inputGroupPrepend">
                                    <Icon icon="icon-park-outline:user" />
                                </span>
                                <input type="text" class="form-control" id="username" aria-describedby="inputGroupPrepend"
                                    required v-model="username" />
                                <div class="invalid-feedback fs-5">暱稱不得為空</div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="userEmail" class="form-label fs-5">Email</label>
                            <div class="input-group has-validation">
                                <span class="input-group-text bg-danger" id="inputGroupPrepend">
                                    <Icon icon="icon-park-outline:mail" />
                                </span>
                                <input type="email" class="form-control" id="userEmail" aria-describedby="inputGroupPrepend"
                                    required v-model="email" />
                                <div class="invalid-feedback fs-5">
                                    {{
                                        (() => {
                                            if (email === '') {
                                                return 'Email不得為空'
                                            } else {
                                                const reg = "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}";
                                                if (!email.match(reg)) {
                                                    return 'Email格式錯誤'
                                                }
                                            }
                                        })()
                                    }}
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="userAccount" class="form-label fs-5">帳號</label>
                            <div class="input-group has-validation">
                                <span class="input-group-text bg-danger" id="inputGroupPrepend">
                                    <Icon icon="icon-park-outline:people" />
                                </span>
                                <input type="text" class="form-control" id="userAccount"
                                    aria-describedby="inputGroupPrepend" required v-model="account" />
                                <div class="invalid-feedback fs-5">帳號不得為空</div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="password" class="form-label fs-5">密碼</label>
                            <div class="input-group has-validation">
                                <span class="input-group-text bg-danger" id="passwordIcon">
                                    <Icon icon="ph:lock-key-bold" />
                                </span>
                                <input type="password" class="form-control" id="password" aria-describedby="passwordIcon"
                                    required autocomplete="off" v-model="password" />
                                <div class="invalid-feedback fs-5">密碼不得為空</div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="checkPassword" class="form-label fs-5">確認密碼</label>
                            <div class="input-group has-validation">
                                <span class="input-group-text bg-danger" id="passwordIcon">
                                    <Icon icon="ph:lock-key-bold" />
                                </span>
                                <input type="password" class="form-control" id="checkPassword"
                                    aria-describedby="passwordIcon" required autocomplete="off" v-model="repassword"
                                    :pattern="password" />
                                <div class="invalid-feedback fs-5">密碼不一致</div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="userPhone" class="form-label fs-5">電話</label>
                            <div class="input-group has-validation">
                                <span class="input-group-text bg-danger" id="inputGroupPrepend">
                                    <Icon icon="icon-park-outline:phone" />
                                </span>
                                <input type="phone" class="form-control" id="userPhone" aria-describedby="inputGroupPrepend"
                                    pattern="0[0-9]{9}" v-model="phone" />
                                <div class="invalid-feedback fs-5">電話格式不正確 0xxxxxxxxx</div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="userBirthday" class="form-label fs-5">生日</label>
                            <div class="input-group has-validation">
                                <span class="input-group-text bg-danger" id="inputGroupPrepend">
                                    <Icon icon="icon-park-outline:calendar" />
                                </span>
                                <input type="date" class="form-control" id="userBirthday"
                                    aria-describedby="inputGroupPrepend" :max="maxBirthday" v-model="birthday" />
                                <div class="invalid-feedback fs-5"></div>
                            </div>
                        </div>
                        <div class="col-12 text-center">
                            <p class="fs-5 fw-bold tw-text-red-600">{{ errorText }}</p>
                        </div>
                        <div class="col-12 text-center">
                            <button class="btn btn-primary btn-lg fw-bolder my-3" type="submit">
                                註冊
                            </button>
                            <p class="fs-5">
                                已有帳號?
                                <RouterLink to="/login">
                                    <span class="fw-bolder hover:tw-text-[red]">立即登入</span>
                                </RouterLink>
                            </p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref, reactive, computed, toRefs } from 'vue';
import axios from 'axios';
import { getAccountAPI, setting } from '../assets/JS/function';
import { useRouter } from 'vue-router';
import { useAccountStore } from '../stores/account';

const router = useRouter();
const accountStore = useAccountStore();

let signUpForm = ref();
const signUpData = reactive({
    username: '',
    email: '',
    account: '',
    password: '',
    repassword: '',
    phone: '',
    birthday: '',
});
const { username, email, account, password, repassword, phone, birthday } = toRefs(signUpData);

const errorText = ref('');
async function signUpCheck(event) {
    if (!signUpForm.value.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
    } else {
        const res = await axios.post(getAccountAPI('signUp'), {
            "name": username.value,
            "email": email.value,
            "account": account.value,
            "password": password.value,
            "phone": phone.value,
            "birthday": birthday.value
        }, setting).catch((err) => {
            console.log(`註冊失敗，原因為${err}`)
        })

        console.log(res);
        if (!res) { return; }
        if (res.data.status == 200) {
            accountStore.tk = res.data.data;
            router.push('/');
        } else {
            errorText.value = res.data.message
        }
    }
    signUpForm.value.classList.add('was-validated')
}

let maxBirthday = computed(() => {
    const today = new Date()
    return today.toISOString().split('T')[0]
})
</script>

<style lang="scss" scoped>
input {
    &:focus {
        border: 1px solid #8f8f8f;
        outline: none;
        box-shadow: none;
    }
}

.was-validated .form-control:invalid,
.was-validated .form-control:valid {
    border: none;

    &:focus {
        box-shadow: none;
    }
}

.input-group-text {
    border: 0;
}

.form-label:has(+div>input:required)::after {
    content: " *";
    color: red;
}
</style>
