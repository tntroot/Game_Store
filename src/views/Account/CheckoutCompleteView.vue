<script setup>
import BuyGame from '../../components/BuyGame.vue';
import { ref } from 'vue'

let shopping = ref('')
shopping.value = [
    {
        id: 1,
        name: '冰與火之舞',
        zip: ''
    },
    {
        id: 2,
        name: '幻塔',
        zip: ''
    },
    {
        id: 3,
        name: 'Minecraft',
        zip: ''
    }
]
</script>

<template>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="text-center p-5 text-center text-white">
                    <p class="h2 fw-bolder">購買成功</p>
                    <p class="h4 fw-bolder">遊戲已加入到你的帳戶，你隨時可以進行下載</p>
                    <RouterLink to="/search">
                        <button type="button" class="btn btn-primary btn-hover btn-lg fw-bolder">前往選購</button>
                    </RouterLink>
                </div>
            </div>
            <BuyGame :shopping="shopping" :activeView="1" />
        </div>
    </div>
</template>

<style lang="scss" scoped>
@import '@/assets/SASS/repeat';

.btn {
    &-hover{
        @include btn-onClick();
    }
    &-color {
        @include btn-onClick(rgb(0, 179, 255));
    }
}

</style>
