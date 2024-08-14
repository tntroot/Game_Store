<template>
    <div class="container">
        <div class="row tw-mt-[30vh]">
            <div class="col-12">
                <p class="h1 fw-bolder text-center text-white">登出中 ... 請稍後</p>
                <div class="text-center mt-5">
                    <div class="spinner-border text-light tw-w-12 tw-h-12 tw-border-[0.5rem]" role="status">
                        <span class="visually-hidden">Loading...</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
     
<script setup>
import { useRouter } from 'vue-router';
import { useAccountStore } from '@/stores/account';

const accountStore = useAccountStore();
const router = useRouter();
function signOut(time) {
    accountStore.tk = '';
    accountStore.account = '';
    setTimeout(() => {
        router.push('/');
    }, time);
}

signOut(1500); // 3秒後跳轉
</script>

<style></style>