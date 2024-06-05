<script>
import { RouterLink } from 'vue-router';
export default {
    data() {
        return {
            search: "",
            route: this.$route.query.type || "",
        }
    },
    methods: {
        searchFu() {
            if (this.search.trim()) {
                this.$router.push({ path: '/search', query: { search: this.search } });
            }else{
                this.$router.push({ path: '/search', query: { search: this.search, type: 'all' } });
                console.log(123);
            }
        },

        shopping() {
            this.$router.push("/account/shoppingCar");
        },
        account() {
            this.$router.push("/login");
        }
    },
    watch: {
        "$route": {
            handler() {
                this.route = this.$route.query.type || "";
            },
            deep: true,
            immediate: false,
        }
    }
}
</script>
<template>
    <nav class="navbar navbar-expand-lg navbar-light bg-light p-0 sticky-top">
        <div class="container px-4 px-lg-5 position-relative">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
                    class="navbar-toggler-icon"></span></button>
            <RouterLink to="/" style="background-color: transparent;">
                <div class="navbar-brand fs-3">夢幻宇宙網</div>
            </RouterLink>
            <div class=" order-1 order-lg-5">
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
                            <RouterLink to="/search?type=all">
                                <li class="dropdown-item" :class="[route === 'all' ? 'router-link-active' : '']">全部</li>
                            </RouterLink>
                            <RouterLink to="/search?type=newGame">
                                <li class="dropdown-item" :class="[route === 'newGame' ? 'router-link-active' : '']">新遊戲</li>
                            </RouterLink>
                            <RouterLink to="/search?type=rank">
                                <li class="dropdown-item" :class="[route === 'rank' ? 'router-link-active' : '']">排行</li>
                            </RouterLink>
                            <RouterLink to="/search?type=free&all=a123">
                                <li class="dropdown-item" :class="[route === 'free' ? 'router-link-active' : '']">免費遊戲</li>
                            </RouterLink>
                        </ul>
                    </li>
                    <li class="nav-item ms-4 ">
                        <div class="d-flex border-1 tw-border-gray-600 rounded-pill nav-link">
                            <input class="form-control" type="text" placeholder="遊戲名稱" v-model.trim="search"
                                @keyup.enter="searchFu">
                            <button class="btn btn-outline-success btn-secondary" type="button" @click="searchFu">
                                <Icon icon="icon-park:search" class="fs-5" />
                            </button>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</template>

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
.dropdown-menu{
    a:nth-child(1)>li{
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