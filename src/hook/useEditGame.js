import { onMounted, reactive, toRefs } from 'vue';
import axios from 'axios';
import { adminAPI, setting } from '@/assets/JS/function';
import { useRouter } from 'vue-router';

export default function () {
    const router = useRouter();

    /** 是否為特價 */
    const isspecial = ref(false);
    /** 
     * 預覽圖片
     */
    const imgPreview = ref([]);
    /** 新增遊戲 */
    const addGameData = reactive({
        name: '', price: '', type: [], sale_price: null, img: '', file: '', content: '',

        system: '', cpu: '', ram: '', display_card: '', directX: '', rom: '',
    });

    /** 上傳到伺服器前先在網頁上顯示圖片 
     * @param {event} e 當檔案被選擇時發生
    */
    function changeImg(e) {
        let file = e.target.files;
        imgPreview.value = [];
        for (let i = 0; i < file.length; i++) {
            let url = URL.createObjectURL(file[i]);
            imgPreview.value.push(url);
        }
        addGameData.img = file.length ? file : '';
    }

    /** 獲取上傳的檔案 */
    function changeFile(e) {
        addGameData.file = e.target.files[0] || '';
    }

    /** 獲取當前組件 -> 表單 */
    const addGameForm = ref();
    /** 錯誤訊息 */
    const errorText = ref('');
    /** 新增遊戲 */
    async function addGame(path, gameId = null) {
        if (!addGameForm.value.checkValidity()) {
            addGameForm.value.reportValidity();
            return;
        }
        if (!isspecial.value) {
            addGameData.sale_price = addGameData.price;
        }
        const formData = new FormData();
        for (let key in addGameData) {
            if (key == 'img') {
                for (let i = 0; i < addGameData[key].length; i++) {
                    formData.append('img[]', addGameData[key][i]);
                }
                continue;
            }
            formData.append(key, addGameData[key]);
        }

        if (gameId) {
            formData.append('id', gameId);
        }

        const res = await axios.post(adminAPI(path[0], path[1]), formData, {
            headers: {
                'Content-Type': 'multipart/form-data'
            }
        }).catch((err) => {
            console.log(err);
        })
        if (!res) { return; }
        if (res.data.status == 200) {
            router.push('/admin/game/gameShow');
        } else {
            errorText.value = res.data.message;
        }
        console.log(res, formData);
        
    }

    return {
        isspecial, imgPreview, addGameData, changeImg, changeFile, addGameForm, errorText, addGame, router
    }
}