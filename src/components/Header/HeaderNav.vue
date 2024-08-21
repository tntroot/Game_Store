<template>
    <nav class="navbar navbar-expand-xl navbar-light tw-bg-[#c1b0ffda] p-0 sticky-top">
        <div class="container px-4 px-lg-5 position-relative">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <RouterLink to="/" style="background-color: transparent;">
                <div class="navbar-brand fs-3">夢幻宇宙網</div>
            </RouterLink>
            <div class=" order-1 order-lg-5 position-relative">
                <button class=" btn-shop-account" @click="account">
                    <Icon icon="ic:round-account-circle" />
                </button>
                <button class=" btn-shop-account" @click="shopping">
                    <Icon icon="icon-park:shopping-cart" />
                </button>
            </div>
            <div class="collapse navbar-collapse order-5 order-lg-1" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 fs-4">
                    <RouterLink to="/">
                        <li class="nav-item nav-link px-3">首頁</li>
                    </RouterLink>
                    <!-- <RouterLink to="/search">
                        <li class="nav-item nav-link">關於</li>
                    </RouterLink> -->
                    <li class="nav-item dropdown pb-lg-0 pb-3 px-3">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">商店</a>
                        <ul class="dropdown-menu py-0" aria-labelledby="navbarDropdown">
                            <RouterLink :to="{ path: '/search', query: { ...route.query, type: '' } }">
                                <li class="dropdown-item" :class="[thisRoute === '' ? 'router-link-active' : '']">全部
                                </li>
                            </RouterLink>
                            <RouterLink :to="{ path: '/search', query: { ...route.query, type: '新遊戲' } }">
                                <li class="dropdown-item" :class="[thisRoute === '新遊戲' ? 'router-link-active' : '']">新遊戲
                                </li>
                            </RouterLink>
                            <RouterLink :to="{ path: '/search', query: { ...route.query, type: '促銷' } }">
                                <li class="dropdown-item" :class="[thisRoute === '促銷' ? 'router-link-active' : '']">促銷
                                </li>
                            </RouterLink>
                            <RouterLink :to="{ path: '/search', query: { ...route.query, type: '免費遊戲' } }">
                                <li class="dropdown-item" :class="[thisRoute === '免費遊戲' ? 'router-link-active' : '']">
                                    免費遊戲</li>
                            </RouterLink>
                        </ul>
                    </li>
                    <li class="nav-item dropdown pb-lg-0 pb-3 px-3">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">成果展</a>
                        <ul class="dropdown-menu py-0" aria-labelledby="navbarDropdown">
                            <li class="dropdown-item tw-cursor-pointer" @click="onFile('ebook')">電子書</li>
                            <li class="dropdown-item tw-cursor-pointer" @click="onFile('ppt')">簡報</li>
                            <li class="dropdown-item tw-cursor-pointer" @click="onFile('poster')">A1 海報</li>
                            <li class="dropdown-item tw-cursor-pointer" @click="onFile('video')">錄影檔</li>
                        </ul>
                    </li>
                    <li class="nav-item ms-4 ">
                        <div class="d-flex rounded-pill nav-link">
                            <input class="form-control" type="text" placeholder="遊戲名稱" v-model.trim="search"
                                @keyup.enter="searchFu">
                            <button class="btn btn-outline-success btn-secondary" type="button" @click="searchFu">
                                <Icon icon="icon-park:search" class="fs-5" />
                            </button>
                        </div>
                    </li>
                </ul>
            </div>

            <div class=" position-absolute end-0 top-100" v-if="accountStore.account">
                <div class="bg-white tw-w-[10rem]" v-show="showAcc">
                    <RouterLink to="/account/manageAccount/account"
                        class="btn btn-outline-secondary btn-lg fw-bold w-100">
                        我的帳號
                    </RouterLink>
                    <RouterLink to="/admin/admin" class="btn btn-outline-secondary btn-lg fw-bold w-100"
                        v-if="accountStore.isAccountAdmin == 0">
                        管理後臺
                    </RouterLink>
                    <RouterLink to="/account/signout" class="btn btn-outline-secondary btn-lg fw-bold w-100">
                        登出
                    </RouterLink>
                </div>
            </div>
        </div>
    </nav>
</template>

<script setup>
import { RouterLink, useRoute, useRouter } from 'vue-router';
import { ref, watch } from "vue";
import { storeToRefs } from 'pinia';

import { useAccountStore } from '@/stores/account';
import { useHeaderStore } from '@/stores/header';

const headerStore = useHeaderStore();
const { search, thisRoute } = storeToRefs(headerStore);
const { searchFu, shopping } = headerStore;

const router = useRouter();
const route = useRoute();
const accountStore = useAccountStore();

const showAcc = ref(false);
function account() {
    if (!accountStore.account) {
        router.push('/login');
    } else {
        showAcc.value = !showAcc.value
    }
}
function admin() {
    router.push('/admin');
}

function onFile(type) {
    const href = "https://localhost:3000/ebook/index.html";
    switch (type) {
        case 'ebook':
            window.location.href = new URL('../../assets/ebook/index.html', import.meta.url);
            break;
        case 'ppt':
            window.location.href = new URL('../../assets/ebook/專題報告.pdf', import.meta.url);
            break;
        case 'poster':
            window.location.href = new URL('../../assets/img/夢幻宇宙網-1.jpg', import.meta.url);
            break;
        case 'video':
            window.location.href = new URL('../../assets/video/113-1-11.ecm.mp4/index.html', import.meta.url);
            break;
    }
}

watch(useRoute(), (newValue) => {
    thisRoute.value = newValue.query.type || "";
    search.value = "";
    showAcc.value = false
}, { immediate: true, deep: true });

</script>

<style lang="scss" scoped>
.router-link-active {
    background-color: rgb(218, 218, 218);
}

// 購物車/個人資訊按鈕
.btn-shop-account {
    border: none;
    padding: 0 0.5rem;
    font-size: 2.5rem;
    background: none;

    &:hover {
        transform: scale(1.1);
    }

    &:active {
        transform: scale(0.9);
    }
}

// 搜尋框設定
.form-control {
    border-radius: 50rem 0 0 50rem;
    border: 1px solid #8f8f8f;

    &:focus {
        border: 1px solid #8f8f8f;
        outline: none;
        box-shadow: none;
    }
}

// 搜尋按鈕
.btn-outline-success {
    border: none;
    border-radius: 0 50rem 50rem 0;
    padding: 0.5rem 1rem;
}

// 下拉選單設定
.dropdown-menu {
    a:nth-child(1)>li {
        border-bottom: 1px solid #c4c4c4;
    }

    .dropdown-item {
        padding: 0.5rem 0 0.5rem 1rem;

        &:hover {
            background-color: rgb(218, 218, 218);
            font-weight: bolder;
        }
    }
}
</style>