<template>
    <div class="container">
        <ItemCard :itemList="itemCard" />
        <div class="row">
            <div class="col-12 bg-white rounded-4 p-3">
                <p class="h2">遊戲內容</p>
                <pre id="Game_Content" class="m-5 tw-text-[22px]"
                    style="white-space: pre-wrap; word-wrap: break-word;" v-html="itemCard.content"></pre>
                <p class="h2">系統需求</p>
                <div id="Sys_Require">
                    <div class="row">
                        <div class="col-md-12 px-lg-5">
                            <p class="h5 fw-bolder">{{ '建議配置' + ' :' }}</p>
                            <div class="table-responsive">
                                <table
                                    class="table table-bordered border-2 border-black mx-lg-5 tw-w-[100%] lg:tw-w-[75%] tw-text-[12px] md:tw-text-[20px]">
                                    <tr>
                                        <td>作業系統：</td>
                                        <td>{{ itemCard.system ? itemCard.system : '無' }}</td>
                                    </tr>
                                    <tr>
                                        <td>處理器：</td>
                                        <td>{{ itemCard.cpu ? itemCard.cpu : '無' }}</td>
                                    </tr>
                                    <tr>
                                        <td>記憶體：</td>
                                        <td>{{ itemCard.ram ? itemCard.ram : '無' }}</td>
                                    </tr>
                                    <tr>
                                        <td>顯示卡：</td>
                                        <td>{{ itemCard.display_card ? itemCard.display_card : '無' }}</td>
                                    </tr>
                                    <tr>
                                        <td>DirectX：</td>
                                        <td>{{ itemCard.directX ? itemCard.directX : '無' }}</td>
                                    </tr>
                                    <tr>
                                        <td>所需空間：</td>
                                        <td>{{ itemCard.rom ? itemCard.rom : '無' }}</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-5">
            <div class="bg-white p-4 w-100 rounded-4">
                <p class="h3 text-success">為此遊戲添加評論</p>
                <div class="px-md-3 col-8 mx-auto" v-if="isBuy">
                    <form class="g-3" @submit.prevent="addMessage">
                        <div class="d-flex align-items-start my-4">
                            <img class="rounded-circle img-fluid me-2" src="../assets/img/account.png" width="75"
                                alt="" />
                            <textarea name="" id="" class="form-control tw-h-[120px]" placeholder="輸入評論"
                                required v-model="message"></textarea>
                        </div>
                        <div class="text-center ">
                            <button type="reset" class="btn btn-secondary btn-lg fw-bold me-4">重製</button>
                            <button type="submit" class="btn btn-primary btn-lg fw-bold">送出</button>
                        </div>
                    </form>
                </div>
                <div class="px-md-3 col-8 mx-auto text-center py-5" v-else>
                    <p class="text-danger fs-3 fw-bold mb-3">請先購買遊戲後才能評論</p>
                </div>
            </div>
        </div>

        <MessageBoard ref="messageBoardDiv" :isBuy="isBuy" />
    </div>
</template>

<script setup>
import ItemCard from '@/components/ItemCard.vue'
import MessageBoard from '@/components/MessageBoard.vue';
import { ref, onMounted, nextTick } from 'vue'
// import { useRoute } from 'vue-router'
import { gameAPI, numFormat, setting } from '../assets/JS/function'
import axios from 'axios';
import { useAccountStore } from '@/stores/account.js';
import { storeToRefs } from 'pinia';

let route = useRoute();
const { tk } = storeToRefs(useAccountStore());

const message = ref('');
const messageBoardDiv = ref();
function addMessage() {
    messageBoardDiv.value.addMessage(message.value);
    message.value = '';
}

/** 載入遊戲內容 */
let itemCard = ref({});
/** 是否購買了遊戲 */
let isBuy = ref(false);
onMounted(async () => {

    /** 載入遊戲內容 */
    if (!route.meta.itemData) { return; }
    const data2 = route.meta.itemData;
    numFormat(data2)
    itemCard.value = data2;

    /** 是否購買了遊戲 */
    const res = await axios.post(gameAPI("isBuyGame"), {
        "token": `Bearer ${tk.value}`,
        "game_id": route.query.gameId,
    }, setting).catch((err) => {
        console.log(err);
    })
    if (!res) { return; }
    if (res.data.status == 200) {
        isBuy.value = true;
    }   
})

</script>

<style lang="scss" scoped>
.h2,
.h3 {
    border-bottom: 0.3rem solid #00d9ff;
    padding-bottom: 1rem;
    font-weight: bold;
}

table {
    tr>td:nth-child(1) {
        table-layout: fixed;
    }
}

.form-control {
    border: 2px solid #8f8f8f;
}
</style>

<!-- https://codesandbox.io/p/sandbox/qd6gyz?file=%2Findex.html%3A171%2C16-171%2C75 -->
