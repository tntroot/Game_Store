<script>
export default {
    data() {
        return {

        }
    },
    mounted() {

    },
    methods: {
        login() {
            alert('登入成功');
        },
        loginCheck(event) {
            const form = document.querySelector('.needs-validation');
            if (!form.checkValidity()) {
                event.preventDefault()
                event.stopPropagation()
            } else {
                console.log(123);
            }

            form.classList.add('was-validated')
        }
    }
}
</script>

<template>
    <div class="container">
        <div class="row">
            <div class="col-12 mt-5">
                <div class="tw-bg-[#123456] p-5 rounded-4 tw-w-fit mx-auto sm:tw-w-[35rem] mt-5">
                    <div class=" text-white">
                        <form action="" class="row g-3 needs-validation" novalidate @submit.prevent="loginCheck">
                            <p class="h3 fw-bolder text-center">登入</p>
                            <div class="col-12">
                                <label for="account" class="form-label fs-5">帳號</label>
                                <div class="input-group has-validation">
                                    <span class="input-group-text" id="accountIcon">
                                        <Icon icon="icon-park-outline:people" />
                                    </span>
                                    <input type="text" class="form-control" id="account" aria-describedby="accountIcon"
                                        required>
                                    <div class="invalid-feedback fs-5">帳號不得為空</div>
                                </div>
                            </div>
                            <div class="col-12">
                                <label for="password" class="form-label fs-5">密碼</label>
                                <div class="input-group has-validation">
                                    <span class="input-group-text" id="passwordIcon">
                                        <Icon icon="ph:lock-key-bold" />
                                    </span>
                                    <input type="password" class="form-control" id="passwrd" aria-describedby="passwordIcon"
                                        required>
                                    <div class="invalid-feedback fs-5">密碼不得為空</div>
                                </div>
                            </div>
                            <div class="text-center">
                                <button class="btn btn-primary btn-lg fw-bolder my-3" type="submit">登入</button>
                                <p class="fs-5">還沒有帳號嗎? 
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

<style lang="scss" scoped>
input{
    &:focus {
        border: 1px solid #8f8f8f;
        outline: none;
        box-shadow: none;
    }
}
.was-validated .form-control:invalid, .was-validated .form-control:valid{
    border: none;
}
</style>