<template>
    <div class="container">
        <HeaderMassage :messageData="messageModify('查看 '+title+' 所有評論')" />

        <div class="card my-5">
            <div class="row g-0">
                <div class="col-lg-6 bg-black">
                    <img class="w-100 md:tw-h-[24rem] tw-h-[12rem]" :src="itemList.img[0]" alt="" srcset="">
                </div>
                <div class="col-lg-6">
                    <div class="card-body">
                        <h1 class="card-title">{{ itemList.name }}</h1>
                        <table class=" itemTable">
                            <tr>
                                <td>上架時間：</td>
                                <td><small class="text-muted">{{ itemList.date }}</small></td>
                            </tr>
                            <tr>
                                <td>遊戲標籤：</td>
                                <td>
                                    <div class="d-flex flex-wrap">
                                        <div v-for="(item, index) in itemList.type">
                                            <button @click="searchGame(item)">
                                                <span class=" tw-text-blue-600 hover:tw-text-red-600">{{ item }}</span>
                                                <span v-if="itemList.type.length !== index + 1">、</span>
                                            </button>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    價格：
                                </td>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <h5 class="card-text text-danger fw-bolder fs-1 me-2 py-3"> {{
                                            itemList.sale_price != 0 ? `$ ${itemList.sale_price}` :
                                            '免費' }}</h5>
                                        <h5 v-if="itemList.sale_price != itemList.price"
                                            class="text-decoration-line-through">${{ itemList.price }}</h5>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <MessageBoard ref="messageBoardDiv" :isBuy="true" />
    </div>
</template>

<script setup>
import HeaderMassage from '@/components/Admin/HeaderMassage.vue';
import AdminHeadermessage from '@/hook/AdminHeaderMassage';
import { onMounted, ref } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import MessageBoard from '@/components/MessageBoard.vue';

const { messageModify } = AdminHeadermessage();
const route = useRoute();
const router = useRouter();

const title = ref('');
const itemList = ref({});
function searchGame(){
    /** 載入遊戲內容 */
    if (!route.meta.itemData) { return; }
    title.value = route.meta.title
    const data2 = route.meta.itemData;
    itemList.value = data2;
}
searchGame();
</script>

<style lang="scss" scoped>
.card-title {
    border-bottom: 0.3rem solid #00d9ff;
    padding-bottom: 1rem;
}

.itemTable {
    font-size: 1rem;
    table-layout: fixed;
    width: 100%;

    tr>td:nth-child(1) {
        padding: 0.3rem 0;
        width: 100px;
    }

    @media screen and (min-width: 600px) {
        font-size: 1.5rem;
        & > tr>td:nth-child(1) {
            padding: 0.3rem 0;
            width: 150px;
        }
    }
}
</style>