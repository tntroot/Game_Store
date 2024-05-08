<script>
import { Icon } from '@iconify/vue';
export default {
    components:{
        Icon, 
    },
    data() {
        return {

        }
    },
}
</script>
<template>
    <nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top">
        <div class="container px-4 px-lg-5 position-relative">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <a class="navbar-brand" href="#!">夢幻宇宙網</a>
            <div class=" order-1 order-lg-5">
                <button class=" btn-shop-account">
                    <Icon icon="ic:round-account-circle" />
                </button> 
                <button class=" btn-shop-account">
                    <Icon icon="icon-park:shopping-cart" />
                </button> 
            </div>  
            <div class="collapse navbar-collapse order-5 order-lg-1" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">首頁</a></li>
                    <li class="nav-item"><a class="nav-link" href="#!">關於</a></li>
                    <li class="nav-item dropdown pb-lg-0 pb-3">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">商店</a>
                        <ul class="dropdown-menu py-0" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#!">新遊戲</a></li>
                            <li><a class="dropdown-item" href="#!">排行</a></li>
                            <li><a class="dropdown-item" href="#!">免費遊戲</a></li>
                        </ul>
                    </li>
                    <li class="nav-item ms-4">
                        <form class="d-flex border-1 tw-border-gray-600 rounded-pill">
                            <input class="form-control" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success btn-secondary" type="submit">
                                <Icon icon="icon-park:search" class="fs-5" />
                            </button>
                        </form>
                    </li>
                </ul>
            </div>   
        </div>
    </nav>
</template>

<style lang="scss" scoped>
    .btn-shop-account{
        border: none;
        padding: 0 0.5rem;
        font-size: 2.5rem;
        background: none;
        &:hover{
            transform: scale(1.1);
        }
        &:active{
            transform: scale(0.9);
        }
    }
    .form-control{
        border-radius:50rem 0 0 50rem;
        &:focus{
            border: none;
            outline: none;
            box-shadow: none;
        }
    }
    .btn-outline-success{
        border: none;
        border-radius: 0 50rem 50rem 0;
        padding: 0.5rem 1rem;
    }

    .dropdown-item{
        padding: 0.5rem 0 0.5rem 1rem;
        &:hover{
            background-color: rgb(218, 218, 218);
            font-weight: bolder;
        }
    }
</style>