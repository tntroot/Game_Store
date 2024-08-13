<template>
    <div class="row mt-5">
        <div class="bg-white p-4 w-100 rounded-4">
            <p class="h3">玩家評論</p>
            <div class="px-md-3" v-if="Object.keys(messageList).length">
                <div class="d-flex align-items-start mt-2" v-for="(item1, index1) in messageList" :key="item1.id">
                    <img class="rounded-circle" src="../assets/img/account.png" width="50" alt="" />
                    <div class="w-100">
                        <p class="h4 ps-2 pt-2 fw-bolder tw-text-md">{{ item1.name }}</p>
                        <pre class="ms-2 tw-text-lg" v-html="item1.text"></pre>
                        <div class="d-flex align-items-center">
                            <div class="ms-2">
                                <p class="text-secondary tw-text-md">{{ item1.created_at }}</p>
                            </div>
                            <button type="button" class="btn ms-2 btn-outline-secondary" v-if="isBuy"
                                @click="reolyClick(index1)">
                                <span>回覆</span>
                            </button>
                            <button type="button" class="btn ms-2 btn-outline-danger" @click="deleteMessage(item1.id)" v-if="showDel">
                                <span>刪除留言</span>
                            </button>
                        </div>
                        <form ref="essy" action="" class="mt-2" v-show="reoly == index1"
                            @submit.prevent="addMessage(reolyText, item1.id)">
                            <div class="d-flex align-items-start">
                                <img class="rounded-circle" src="../assets/img/account.png" width="50" alt="" />
                                <textarea class="form-control reply" placeholder="輸入回覆" ref="reolyForm"
                                    v-model="reolyText"></textarea>
                            </div>
                            <div class="tw-ms-14 mt-2">
                                <button type="button" class="btn btn-secondary" @click="reoly = null">
                                    取消
                                </button>
                                <button type="submit" class="btn btn-primary ms-2">
                                    回覆
                                </button>
                            </div>
                            <hr class="my-4" />
                        </form>
                        <div class="d-flex align-items-start mt-2" v-for="(item2, index2) in item1.replyUser"
                            :key="item2.id">
                            <img class="rounded-circle" src="../assets/img/account.png" width="50" alt="" />
                            <div>
                                <p class="h4 ps-2 pt-2 fw-bolder">{{ item2.name }}</p>
                                <pre class="ms-2 tw-text-lg" v-html="item2.text"></pre>
                                <div class="d-flex align-items-center">
                                    <div class="ms-2 text-secondary">{{ item2.created_at }}</div>
                                    <button type="button" class="btn ms-2 btn-outline-danger" v-if="showDel"
                                        @click="deleteMessage(item2.id)">
                                        <span>刪除留言</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="px-md-3 text-center py-5" v-else>
                <p class="text-danger fs-3 fw-bold mb-3">尚未有玩家參與評論</p>
            </div>
        </div>
    </div>
</template>

<script setup>
import { computed, onMounted, reactive, ref } from 'vue';
import { useAccountStore } from '@/stores/account';
import { storeToRefs } from 'pinia';
import { useRoute } from 'vue-router';
import axios from 'axios';
import { gameAPI, setting, adminAPI } from '@/assets/JS/function';

const { tk, account, isAccountAdmin } = storeToRefs(useAccountStore());
const route = useRoute();
defineProps(['isBuy']);

/** 回覆*/
let reoly = ref(false);
/** 回覆 */
let reolyForm = ref();

/** 點級回復按鈕立即會取到文本框焦點
 * @param {number} index 獲取的索引
 */
function reolyClick(index) {
    reoly.value = index;
    nextTick(() => {
        reolyForm.value[index].focus();
    })
}

const reolyText = ref("");
/** 新增留言
 * @param {string} token 使用者token
 * @param {string} text 留言內容
 * @param {number} isreoly 回覆使用者留言內容 id，0 為無
 */
async function addMessage(text, isreoly = 0) {
    const res = await axios.post(gameAPI("messageMd", "message") + "?action=add", {
        "game_id": route.query.gameId,
        "token": `Bearer ${tk.value}`,
        "text": text,
        "isreoly": isreoly
    }, setting).catch((err) => {
        console.log(err);
    })
    if (res.data.status == 200) {
        messageList.value = res.data.data;
    }
    reolyText.value = "";
    reoly.value = null;

}

const showDel = computed(() => {
    return isAccountAdmin.value == 0 && route.path == '/admin/leaveReply/showMessage';
})
/** 刪除留言 
 * @param {number} id 留言id
*/
async function deleteMessage(id) {
    if (confirm('確定要刪除嗎?')) {
        const res = await axios.post(adminAPI("message", "delMessage"), {
            "game_id": route.query.gameId,
            "token": `Bearer ${tk.value}`,
            "id": id
        }, setting).catch((err) => {
            console.log(err);
        })
        if (res.data.status == 200) {
            messageList.value = res.data.data;
        }else{
            alert(res.data.message);
        }
    }
}

/** 獲取留言 */
const messageList = ref({});
onMounted(async () => {
    const res = await axios.post(gameAPI("messageMd", "message"), {
        "game_id": route.query.gameId,
    }, setting).catch((err) => {
        console.log(err);
    })
    if (!res) { return; }
    if (res.data.status == 200) {
        messageList.value = res.data.data;
    }
})

defineExpose({
    addMessage,
})
</script>

<style lang="scss" scoped>
.h2,
.h3 {
    border-bottom: 0.3rem solid #00d9ff;
    padding-bottom: 1rem;
    font-weight: bold;
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

.form-control {
    border: 2px solid #8f8f8f;
}

pre {
    white-space: pre-wrap;
    word-wrap: break-word;
}

button {
    font-weight: bolder;
}
</style>