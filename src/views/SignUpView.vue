<script setup>
import { ref, computed } from 'vue'

let signUp = ref();
function signUpCheck(event) {
    if (!signUp.value.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
    } else {
        console.log(123)
    }
    signUp.value.classList.add('was-validated')
}

let maxBirthday = computed(() => {
    const today = new Date()
    return today.toISOString().split('T')[0]
})
</script>

<template>
    <div class="container">
        <div class="row">
            <div class="col-12 mt-5">
                <div
                    class="tw-bg-[#123456] pb-4 px-5 rounded-4 tw-w-fit mx-auto sm:tw-w-[35rem] mt-5 text-white"
                >
                    <p class="h1 fw-bolder text-center py-5">歡迎註冊！</p>
                    <form class="row g-3 needs-validation" ref="signUp" novalidate @submit.prevent="signUpCheck">
                        <div class="col-md-6">
                            <label for="userEmail" class="form-label fs-5">Email</label>
                            <div class="input-group has-validation">
                                <span class="input-group-text bg-danger" id="inputGroupPrepend">
                                    <Icon icon="icon-park-outline:mail" />
                                </span>
                                <input
                                    type="email"
                                    class="form-control"
                                    id="userEmail"
                                    aria-describedby="inputGroupPrepend"
                                    required
                                />
                                <div class="invalid-feedback fs-5">Email不得為空</div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="userAccount" class="form-label fs-5">帳號</label>
                            <div class="input-group has-validation">
                                <span class="input-group-text bg-danger" id="inputGroupPrepend">
                                    <Icon icon="icon-park-outline:people" />
                                </span>
                                <input
                                    type="text"
                                    class="form-control"
                                    id="userAccount"
                                    aria-describedby="inputGroupPrepend"
                                    required
                                />
                                <div class="invalid-feedback fs-5">帳號不得為空</div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="password" class="form-label fs-5">密碼</label>
                            <div class="input-group has-validation">
                                <span class="input-group-text bg-danger" id="passwordIcon">
                                    <Icon icon="ph:lock-key-bold" />
                                </span>
                                <input
                                    type="password"
                                    class="form-control"
                                    id="password"
                                    aria-describedby="passwordIcon"
                                    required autocomplete="off"
                                />
                                <div class="invalid-feedback fs-5">密碼不得為空</div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="checkPassword" class="form-label fs-5">確認密碼</label>
                            <div class="input-group has-validation">
                                <span class="input-group-text bg-danger" id="passwordIcon">
                                    <Icon icon="ph:lock-key-bold" />
                                </span>
                                <input
                                    type="password"
                                    class="form-control"
                                    id="checkPassword"
                                    aria-describedby="passwordIcon"
                                    required  autocomplete="off"
                                />
                                <div class="invalid-feedback fs-5">密碼不一致</div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="userPhone" class="form-label fs-5">電話</label>
                            <div class="input-group has-validation">
                                <span class="input-group-text bg-danger" id="inputGroupPrepend">
                                    <Icon icon="icon-park-outline:phone" />
                                </span>
                                <input
                                    type="phone"
                                    class="form-control"
                                    id="userPhone"
                                    aria-describedby="inputGroupPrepend"
                                    pattern="0[0-9]{9}"
                                />
                                <div class="invalid-feedback fs-5">電話格式不正確 0xxxxxxxxx</div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label for="userBirthday" class="form-label fs-5">生日</label>
                            <div class="input-group has-validation">
                                <span class="input-group-text bg-danger" id="inputGroupPrepend">
                                    <Icon icon="icon-park-outline:calendar" />
                                </span>
                                <input
                                    type="date"
                                    class="form-control"
                                    id="userBirthday"
                                    aria-describedby="inputGroupPrepend"
                                    :max="maxBirthday"
                                />
                                <div class="invalid-feedback fs-5"></div>
                            </div>
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
</style>
