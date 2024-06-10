<script setup>
import ItemCard from '../components/ItemCard.vue'
import { ref, onMounted, nextTick } from 'vue'
import { useRoute } from 'vue-router'

let route = useRoute();
let reoly = ref(false)
let reolyForm = ref()

function reolyClick() {
    reoly.value = true
    nextTick(() => {
        reolyForm.value.focus()
    })
}

let itemCard = ref({})
onMounted(async () => {
    const url1 = new URL('../assets/JSON/SearchList.json', import.meta.url)
    let data = await fetch(url1).then((res) => res.json())
    let data2 = data.search.filter((item) => item.id == route.query.userId)
    /* 前端圖片轉址，後面用後端船就不須寫這段 */
    for (let i = 0; i < data2[0].img.length; i++) {
        data2[0].img[i] = new URL(`../assets/img/${data2[0].img[i]}`, import.meta.url)
    }
    itemCard.value = data2[0]
})
</script>

<template>
    <div class="container">
        <ItemCard :itemList="itemCard" />
        <div class="row">
            <div class="col-12 bg-white rounded-4 p-3">
                <p class="h2">遊戲內容</p>
                <div id="Game_Content"></div>
                <p class="h2">系統需求</p>
                <div id="Sys_Require">
                    <div class="row">
                        <div class="col-md-6" v-for="(item1, index1) in itemCard.sysReq">
                            <p class="h5 fw-bolder">{{ index1 + ' :' }}</p>
                            <table>
                                <tr>
                                    <td>作業系統：</td>
                                    <td>{{ item1.Window }}</td>
                                </tr>
                                <tr>
                                    <td>處理器：</td>
                                    <td>{{ item1.CPU }}</td>
                                </tr>
                                <tr>
                                    <td>記憶體：</td>
                                    <td>{{ item1.RAM }}</td>
                                </tr>
                                <tr>
                                    <td>顯示卡：</td>
                                    <td>{{ item1.Display_Card }}</td>
                                </tr>
                                <tr>
                                    <td>DirectX：</td>
                                    <td>{{ item1.DirectX }}</td>
                                </tr>
                                <tr>
                                    <td>所需空間：</td>
                                    <td>{{ item1.ROM }}</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-5">
            <div class="bg-white p-4 w-100 rounded-4">
                <p class="h3">玩家評論</p>
                <div class="px-md-3">
                    <div class="d-flex align-items-start mt-2">
                        <img
                            class="rounded-circle"
                            src="../assets/img/account.png"
                            width="50"
                            alt=""
                        />
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
                                        <button
                                            type="button"
                                            class="p-2 hover:tw-bg-[#58e9ff] rounded-circle"
                                        >
                                            <Icon icon="carbon:thumbs-up" class="text-dark" />
                                        </button>
                                        <span class="ms-2">1</span>
                                    </div>
                                    <div class="ms-2">
                                        <button
                                            type="button"
                                            class="p-2 hover:tw-bg-[#fa5656] rounded-circle"
                                        >
                                            <Icon icon="carbon:thumbs-down" class="text-dark" />
                                        </button>
                                        <span class="ms-2">0</span>
                                    </div>
                                    <button
                                        type="button"
                                        class="btn ms-2 hover:tw-bg-[gray] hover:tw-text-white"
                                        @click="reolyClick"
                                    >
                                        <span>回覆</span>
                                    </button>
                                </div>
                                <form action="" class="mt-2" v-show="reoly" @submit.prevent="">
                                    <div class="d-flex align-items-center">
                                        <img
                                            class="rounded-circle"
                                            src="../assets/img/account.png"
                                            width="50"
                                            alt=""
                                        />
                                        <input
                                            type="text"
                                            class="form-control reply"
                                            placeholder="輸入回覆"
                                            ref="reolyForm"
                                        />
                                    </div>
                                    <div class="tw-ms-14 mt-2">
                                        <button
                                            type="button"
                                            class="btn btn-secondary"
                                            @click="reoly = false"
                                        >
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
                                <img
                                    class="rounded-circle"
                                    src="../assets/img/account.png"
                                    width="50"
                                    alt=""
                                />
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

<style lang="scss" scoped>
.h2,
.h3 {
    border-bottom: 0.3rem solid #00d9ff;
    padding-bottom: 1rem;
    font-weight: bold;
}

table {
    tr > td:nth-child(1) {
        width: 90px;
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
</style>

<!-- https://codesandbox.io/p/sandbox/qd6gyz?file=%2Findex.html%3A171%2C16-171%2C75 -->
