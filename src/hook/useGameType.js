import axios from "axios";
import { onMounted, ref } from "vue";
import { adminAPI, setting } from '@/assets/JS/function';

export default function () {

    /** 列出所有游戲類型 */
    const gameType = ref([]);
    onMounted(async () => {
        const res = await axios.get(adminAPI('game', 'showGameType')).catch((err) => {
            console.log(err);
        })

        if (res.data.status == 200) {
            gameType.value = res.data.data;
        }
    })

    /** 新增遊戲類型 */
    const addType = ref('');
    async function addGameType() {
        if (!addType.value) { return; }
        const res = await axios.post(adminAPI('game', 'addGameType'), {
            name: addType.value
        }, setting).catch((err) => {
            console.log(err);
        })
        if (res.data.status == 200) {
            gameType.value.push(res.data.data);
        }
        addType.value = '';
    }

    /** 回傳 */
    return { gameType, addType, addGameType };
}