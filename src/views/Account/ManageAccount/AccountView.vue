<template>
    <div class="row justify-content-center">
        <div class="col-9">
            <form ref="mAcc" class="row g-3 needs-validation bg-secondary tw-rounded-xl p-5" @submit.prevent="mAccCheck"
                novalidate>
                <div class="col-md-4"></div>
                <div class="col-md-8">
                    <div class="row g-4">
                        <div class="col-md-6">
                            <label for="username" class="form-label fs-5">暱稱</label>
                            <div class=" input-group has-validation">
                                <span class="input-group-text bg-danger" id="inputGroupPrepend">
                                    <Icon icon="icon-park-outline:user" />
                                </span>
                                <input type="text" class="form-control" id="username"
                                    aria-describedby="inputGroupPrepend" required v-model="username" />
                                <div class="invalid-feedback fs-5">暱稱不得為空</div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="userEmail" class="form-label fs-5">Email</label>
                            <div class="input-group has-validation">
                                <span class="input-group-text bg-danger" id="inputGroupPrepend">
                                    <Icon icon="icon-park-outline:mail" />
                                </span>
                                <input type="email" class="form-control" id="userEmail"
                                    aria-describedby="inputGroupPrepend" required v-model="email" placeholder="ex: xxxxx@gmail.com" />
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
                            <label for="password" class="form-label d-block fs-5">密碼</label>
                            <input type="password" disabled value="*********" class="form-control d-inline-block tw-w-[70%]"
                                style="background-color: #c4c4c4;">
                            <RouterLink to="/manageAccount/changePwd" class="btn btn-danger fw-bold ms-3">修改</RouterLink>
                        </div>
                        <div class="col-md-6">
                            <label for="userPhone" class="form-label fs-5">電話</label>
                            <div class="input-group has-validation">
                                <span class="input-group-text bg-danger" id="inputGroupPrepend">
                                    <Icon icon="icon-park-outline:phone" />
                                </span>
                                <input type="phone" class="form-control" id="userPhone"
                                    aria-describedby="inputGroupPrepend" pattern="0[0-9]{9}" v-model="phone" placeholder="ex: 0xxxxxxxxx" />
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
                        <div class="col-12">
                            <label for="sex" class="form-label fs-3 fw-bolder">性別：</label>

                            <div class="form-check form-check-inline selectRadio" v-for="(item, index) in ['男','女','不透漏']" @click="sex = index">
                                <input class="form-check-input" type="radio" name="sex" :id="`sexRadio${index+1}`" :value="index" v-model="sex">
                                <label class="form-label" :for="`sexRadio${index+1}`">{{ item }}</label>
                            </div>
                        </div>
                        <div class="col-12 text-center">
                            <p class="fs-5 fw-bold tw-text-red-600">{{ errorText }}</p>
                        </div>
                    </div>
                </div>
                <div class="col-12 text-center">
                    <button type="submit" class="btn btn-primary btn-lg">確認修改</button>
                </div>
            </form>
        </div>
    </div>

    <div class="position-absolute top-100 start-50 translate-middle-x p-3" style="z-index: 11">
        <div ref="liveToast" class="toast bg-white tw-rounded-3xl" role="alert" aria-live="assertive"
            aria-atomic="true">
            <div class="toast-header text-center justify-content-evenly fw-bolder tw-text-[3rem] tw-bg-transparent">
                <Icon icon="mdi:success-circle" class="text-success" />
                <span>修改成功</span>
            </div>
        </div>
    </div>
</template>

<script setup>
import { ref, reactive, toRefs, computed, onMounted } from 'vue';
import axios from 'axios';
import { getAccountAPI, setting } from '@/assets/JS/function.js';
import { useAccountStore } from '@/stores/account';
import { RouterLink } from 'vue-router';

let mAcc = ref();
const mAccData = reactive({
    username: '',
    email: '',
    account: '',
    phone: '',
    birthday: '',
    sex: 2,
});
const { username, email, account, phone, birthday, sex } = toRefs(mAccData);

const liveToast = ref();
const errorText = ref('');
const accountStore = useAccountStore();
async function mAccCheck(event) {
    if (!mAcc.value.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
    } else {
        const token = accountStore.tk;
        const res = await axios.post(getAccountAPI('editUser'), {
            "token": `Bearer ${token}`,
            "name": username.value,
            "email": email.value,
            "account": account.value,
            "phone": phone.value,
            "birthday": birthday.value,
            "sex": sex.value
        }, setting).catch(error => {
            console.log(error);
        });

        if (!res) { return; }
        if (res.data.status == 200) {
            accountStore.tk = res.data.data;
            errorText.value = '';
            liveToast.value.classList.add('show');
            setTimeout(() => {
                liveToast.value.classList.remove('show');
            }, 3000);
        } else {
            errorText.value = res.data.message
        }
        console.log(res.data);
    }
    mAcc.value.classList.add('was-validated')
}

let maxBirthday = computed(() => {
    const today = new Date()
    return today.toISOString().split('T')[0]
})

onMounted(async () => {
    if (accountStore.account) {
        const getUser = await axios.post(getAccountAPI('getUser'), {
            "account": accountStore.account
        }, setting).catch(error => {
            console.log(error);
        });

        if (!getUser) { return; }
        if (getUser.data.status == 200) {
            const data = getUser.data.data;
            username.value = data.name;
            email.value = data.email;
            account.value = data.account;
            phone.value = data.phone;
            birthday.value = data.birthday;
            sex.value = data.sex;
        }
        console.log(getUser.data);
    }
})
</script>

<style lang="scss" scoped>
.form-label:has(+div>input:required)::after {
    content: " *";
    color: red;
}

.form-label {
    font-weight: bold;
}

.invalid-feedback {
    font-weight: bold;
}

.selectRadio{
    padding: 0;
    cursor: pointer;
    .form-check-input{
        width: 1.75rem;height: 1.75rem;
        margin: 0 0.8rem;
        line-height: 1.75rem;
        cursor: pointer;
    }
    .form-label{
        font-weight: bolder;
        color: black;
        font-size: 1.75rem;
        line-height: 1.75rem;
        cursor: pointer;
        &:hover{
            color: red;
        }
    }
}
</style>