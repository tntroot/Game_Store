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
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                    <li class="nav-item dropdown pb-lg-0 pb-3">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                            <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <form class="d-flex">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success" type="submit">Search</button>
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
</style>