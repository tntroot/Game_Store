<template>
    <div class="row justify-content-center">
        <div class="col-6">
            <form ref="mAccPwd" class="row g-3 needs-validation bg-secondary tw-rounded-xl p-5" @submit.prevent="mAccPwdCheck"
                novalidate>
                <div class="col-12">
                    <label for="oldPwd" class="form-label fs-5">原密碼</label>
                    <div class=" input-group has-validation">
                        <span class="input-group-text bg-danger" id="inputGroupPrepend">
                            <Icon icon="ph:lock-key-bold" />
                        </span>
                        <input type="password" class="form-control" id="oldPwd" aria-describedby="inputGroupPrepend" placeholder="請輸入原密碼"
                            required v-model="oldPwd" autocomplete="off" />
                        <div class="invalid-feedback fs-5 fw-bolder">原密碼不得為空</div>
                    </div>
                </div>
                <div class="col-12">
                    <label for="newPwd" class="form-label fs-5">新密碼</label>
                    <div class=" input-group has-validation">
                        <span class="input-group-text bg-danger" id="inputGroupPrepend">
                            <Icon icon="ph:lock-key-bold" />
                        </span>
                        <input type="password" class="form-control" id="newPwd" aria-describedby="inputGroupPrepend" placeholder="請輸入新密碼"
                            required v-model="newPwd" autocomplete="off" />
                        <div class="invalid-feedback fs-5 fw-bolder">新密碼不得為空</div>
                    </div>
                </div>
                <div class="col-12">   
                    <label for="confirmPwd" class="form-label fs-5">確認密碼</label>
                    <div class=" input-group has-validation">
                        <span class="input-group-text bg-danger" id="inputGroupPrepend">
                            <Icon icon="ph:lock-key-bold" />
                        </span>
                        <input type="password" class="form-control" id="confirmPwd" aria-describedby="inputGroupPrepend" placeholder="請輸入確認密碼"
                            required v-model="confirmPwd" :pattern="newPwd" autocomplete="off" />
                        <div class="invalid-feedback fs-5 fw-bolder">確認密碼與新密碼不一致</div>
                    </div>
                </div>
                <div class="col-12 text-center">
                    <p class="fs-5 fw-bold tw-text-red-600">{{ errorText }}</p>
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
    import { ref, reactive, toRefs } from 'vue';
    import axios from 'axios';
    import { getAccountAPI, setting } from '@/assets/JS/function';
    import { useAccountStore } from '@/stores/account.js';
    import { useRouter } from 'vue-router';
    
    const router = useRouter();
    const mAccPwdData = reactive({
        oldPwd: '',
        newPwd: '',
        confirmPwd: ''
    })
    const { oldPwd, newPwd, confirmPwd } = toRefs(mAccPwdData);

    const accountStore = useAccountStore();
    const mAccPwd = ref(); //驗證表單
    const liveToast = ref();  //提示
    const errorText = ref(''); //錯誤訊息
    async function mAccPwdCheck(event) {
        if (!mAccPwd.value.checkValidity()) {
            event.preventDefault()
            event.stopPropagation()
        }else{
            const token = accountStore.tk;
            const res = await axios.post(getAccountAPI('editPwd'), {
                "token": `Bearer ${token}`,
                "oldPwd": oldPwd.value,
                "newPwd": newPwd.value
            }, setting).catch(error => {
                console.log(error);
            });
            console.log(res.data);

            if (!res) { return; }
            if (res.data.status == 200) {
                accountStore.tk = res.data.data;
                errorText.value = '';
                liveToast.value.classList.add('show');
                setTimeout(() => {
                    liveToast.value.classList.remove('show');
                    router.push('/manageAccount/account')
                }, 3000);
            }else{
                errorText.value = res.data.message;
            }
        }
        mAccPwd.value.classList.add('was-validated')
    }
</script>

<style lang="scss" scoped>
.form-label {
    font-weight: bold;
}
</style>