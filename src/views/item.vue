<template>
    <div class="container">
        <ItemCard :itemList="itemCard" />
        <div class="row">
            <div class="col-12 bg-white rounded-4 p-3">
                <p class="h2">遊戲內容</p>
                <pre id="Game_Content" class="m-5 tw-break-words tw-text-[22px]" style="white-space: pre-wrap; word-wrap: break-word;" v-html="itemCard.content"></pre>
                <p class="h2">系統需求</p>
                <div id="Sys_Require">
                    <div class="row">
                        <div class="col-md-12 px-lg-5">
                            <p class="h5 fw-bolder">{{ '建議配置' + ' :' }}</p>
                            <div class="table-responsive">
                                <table class="table table-bordered border-2 border-black mx-lg-5 tw-w-[100%] lg:tw-w-[75%] tw-text-[12px] md:tw-text-[20px]">
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
                                        <td>{{ itemCard.ram  ? itemCard.ram : '無'}}</td>
                                    </tr>
                                    <tr>
                                        <td>顯示卡：</td>
                                        <td>{{ itemCard.display_card ? itemCard.display_card : '無' }}</td>
                                    </tr>
                                    <tr>
                                        <td>DirectX：</td>
                                        <td>{{ itemCard.directX ? itemCard.directX : '無'}}</td>
                                    </tr>
                                    <tr>
                                        <td>所需空間：</td>
                                        <td>{{ itemCard.rom ? itemCard.rom : '無'}}</td>
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
                    <form class="g-3">
                        <div class="d-flex align-items-start my-4">
                            <img class="rounded-circle img-fluid me-2" src="../assets/img/account.png" width="75" alt="" />
                            <textarea name="" id="" class="form-control tw-h-[120px]" placeholder="輸入評論" required></textarea>
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

        <div class="row mt-5">
            <div class="bg-white p-4 w-100 rounded-4">
                <p class="h3">玩家評論</p>
                <div class="px-md-3">
                    <div class="d-flex align-items-start mt-2">
                        <img class="rounded-circle" src="../assets/img/account.png" width="50" alt="" />
                        <div>
                            <div>
                                <p class="h4 ps-2 pt-2 fw-bolder">凱薩</p>
                                <p class="">
                                    Lorem ipsum dolor sit amet consectetur adipisicing elit.
                                    Distinctio aliquam provident saepe esse neque, totam veritatis
                                    enim dolorem voluptatibus necessitatibus. Nam sint minus sunt
                                    accusantium harum totam a quos deleniti.
                                </p>
                                <div class="d-flex align-items-center">
                                    <div class="ms-2">
                                        <button type="button" class="p-2 hover:tw-bg-[#58e9ff] rounded-circle">
                                            <Icon icon="carbon:thumbs-up" class="text-dark" />
                                        </button>
                                        <span class="ms-2">1</span>
                                    </div>
                                    <div class="ms-2">
                                        <button type="button" class="p-2 hover:tw-bg-[#fa5656] rounded-circle">
                                            <Icon icon="carbon:thumbs-down" class="text-dark" />
                                        </button>
                                        <span class="ms-2">0</span>
                                    </div>
                                    <button type="button" class="btn ms-2 hover:tw-bg-[gray] hover:tw-text-white"
                                        @click="reolyClick">
                                        <span>回覆</span>
                                    </button>
                                </div>
                                <form action="" class="mt-2" v-show="reoly" @submit.prevent="">
                                    <div class="d-flex align-items-center">
                                        <img class="rounded-circle" src="../assets/img/account.png" width="50" alt="" />
                                        <input type="text" class="form-control reply" placeholder="輸入回覆"
                                            ref="reolyForm" />
                                    </div>
                                    <div class="tw-ms-14 mt-2">
                                        <button type="button" class="btn btn-secondary" @click="reoly = false">
                                            取消
                                        </button>
                                        <button type="submit" class="btn btn-primary ms-2">
                                            回覆
                                        </button>
                                    </div>
                                    <hr class="my-4" />
                                </form>
                            </div>
                            <div class="d-flex align-items-start mt-2">
                                <img class="rounded-circle" src="../assets/img/account.png" width="50" alt="" />
                                <div>
                                    <p class="h4 ps-2 pt-2 fw-bolder">凱薩</p>
                                    <p class="">
                                        Lorem ipsum dolor sit amet consectetur adipisicing elit.
                                        Distinctio aliquam provident saepe esse neque, totam
                                        veritatis enim dolorem voluptatibus necessitatibus. Nam sint
                                        minus sunt accusantium harum totam a quos deleniti.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import ItemCard from '../components/ItemCard.vue'
import { ref, onMounted, nextTick } from 'vue'
// import { useRoute } from 'vue-router'
import { gameAPI, numFormat, setting } from '../assets/JS/function'
import axios from 'axios';
import { useAccountStore } from '@/stores/account.js';
import { storeToRefs } from 'pinia';

let route = useRoute();
/**
 * 回覆
 */
let reoly = ref(false);
/**  
 * 回覆
 */
let reolyForm = ref();

function reolyClick() {
    reoly.value = true
    nextTick(() => {
        reolyForm.value.focus()
    })
}

let itemCard = ref({});
async function craeteGameContent() {
    if (!route.meta.itemData) { return; }
    const data2 = route.meta.itemData;
    numFormat(data2)
    itemCard.value = data2;
}
craeteGameContent();

const { tk } = storeToRefs(useAccountStore())

/** 是否購買了遊戲 */
let isBuy = ref(false);
onMounted(async() => {
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

.reply {
    border: 0;
    border-bottom: 1px solid black;
    border-radius: 0;
    margin-left: 0.5rem;

    &:focus {
        outline: none;
        box-shadow: none;
        border-bottom: 2px solid black;
    }
}

.form-control{
    border: 2px solid #8f8f8f;
}
</style>

<!-- https://codesandbox.io/p/sandbox/qd6gyz?file=%2Findex.html%3A171%2C16-171%2C75 -->
