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

<script setup>
import BuyGame from '@/components/BuyGame.vue';
import axios from 'axios';
import { onMounted, ref } from 'vue'
import { shopingAPI, setting } from '@/assets/JS/function';
import { useRoute } from 'vue-router';
import { useAccountStore } from '@/stores/account';
import { storeToRefs } from 'pinia';

let shopping = ref('');

const route = useRoute();

const { tk } = storeToRefs(useAccountStore());

onMounted(async() => {
    const res = await axios.post(shopingAPI("purchasedItems"), {
        "token": `Bearer ${tk.value}`,
        "shopHistId": route.query.id
    }, setting).catch((err) => {
        console.log(err);
    })
    if (res.data.status == 200) {
        shopping.value = res.data.data;
    }
    console.log(res);
})
</script>

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
