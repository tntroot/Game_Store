<template>
    <div class="container">
        <HeaderMassage :messageData="messageAdd('新增遊戲')" />

        <div class="row justify-content-center  needs-validation">
            <div class="col-8">
                <form ref="addGameForm" class="row  g-3 justify-content-center bg-white p-5 fs-4 fw-bold"
                    @submit.prevent="addGame" novalidate>
                    <div class="mb-3 row">
                        <div class="col-3 req">遊戲名稱: </div>
                        <div class="col-9">
                            <input type="text" class="form-control px-3" required v-model="addGameData.name">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <div class="col-3 req">價格: </div>
                        <div class="col-9">
                            <span class="me-3">NT$</span>
                            <input type="number" class="form-control d-inline px-3 tw-w-fit" required v-model="addGameData.price" :pattern="addGameData.price >= 0">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <div class="col-3">是否特價: </div>
                        <div class="col-9">
                            <input type="checkbox" class="form-check-input me-3 tw-cursor-pointer" v-model="isspecial" @click="addGameData.sale_price = addGameData.price" >
                            <div v-show="isspecial">
                                <span>請填寫特價價格: </span>
                                <input type="number" class="form-control d-inline px-3 tw-w-fit" v-model="addGameData.sale_price" :pattern="addGameData.sale_price >= 0">
                            </div>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <div class="col-3 req">遊戲檔案: </div>
                        <div class="col-9">
                            <input type="file" accept=".zip, .rar, .7z" class="form-control px-3" required @change="changeFile">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <div class="col-3 req">遊戲圖片: </div>
                        <div class="col-9">
                            <swiper-container class=" tw-cursor-grab" direction="horizontal" slides-per-view="3" space-between="10">
                                <swiper-slide v-for="(item, index) in imgPreview" :key="index">
                                    <img :src="item" width="150" height="150" alt="" class="d-inline-block img-fluid">
                                </swiper-slide>
                            </swiper-container>
                            <input type="file" accept="image/*" multiple class="form-control px-3" required @change="changeImg">
                            <span class="text-secondary fs-5">(ex: 第一張為遊戲封面)</span>
                        </div>
                    </div>
                    <div class="mb-3 row req">
                        <div class="col-3 req">遊戲介紹: </div>
                        <div class="col-9">
                            <textarea name="" id="" cols="30" rows="10" class="form-control" required v-model="addGameData.content"></textarea>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <div class="col-3">遊戲配置: </div>
                        <div class="col-9"></div>
                    </div>
                    <div class="mb-3 row">
                        <div class="col-12">
                            <table class="table table-bordered ms-5 w-50">
                                <tr>
                                    <td>作業系統：</td>
                                    <td><input type="text" class="form-control px-3" v-model="config.system">
                                    </td>
                                </tr>
                                <tr>
                                    <td>處理器：</td>
                                    <td><input type="text" class="form-control px-3" v-model="config.cpu">
                                    </td>
                                </tr>
                                <tr>
                                    <td>記憶體 :</td>
                                    <td><input type="text" class="form-control px-3" v-model="config.ram">
                                    </td>
                                </tr>
                                <tr>
                                    <td>顯示卡 :</td>
                                    <td><input type="text" class="form-control px-3" v-model="config.display_card">
                                    </td>
                                </tr>
                                <tr>
                                    <td>directX :</td>
                                    <td><input type="text" class="form-control px-3" v-model="config.directX">
                                    </td>
                                </tr>
                                <tr>
                                    <td>所需空間 :</td>
                                    <td><input type="text" class="form-control px-3" v-model="config.rom">
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="col text-center">
                        <RouterLink to="/admin/game/gameShow" class="btn btn-secondary btn-lg me-3">回上一頁</RouterLink>
                        <button type="submit" class="btn btn-primary btn-lg">確認新增</button>
                    </div>
                    <div class="text-danger">{{ errorText }}</div>
                </form>
            </div>
        </div>
    </div>
</template>

<script setup>
import HeaderMassage from '@/components/Admin/HeaderMassage.vue';
import AdminHeadermessage from '@/hook/AdminHeaderMassage';
import { reactive, toRefs } from 'vue';
import axios from 'axios';
import { adminAPI, setting } from '@/assets/JS/function';

const { messageAdd } = AdminHeadermessage();

/** 是否為特價 */
const isspecial = ref(false);
/** 
 * 預覽圖片
 */
const imgPreview = ref([]);
/** 新增遊戲 */
const addGameData = reactive({
    name: '',
    price: '',
    sale_price: null,
    img: '',
    file: '',
    content: '',
    config: {
        system: '',
        cpu: '',
        ram: '',
        display_card: '',
        directX: '',
        rom: '',
    },
});
const {config} = toRefs(addGameData);

function changeImg(e) {
    let file = e.target.files;
    for (let i = 0; i < file.length; i++) {
        let url = URL.createObjectURL(file[i]);
        imgPreview.value.push(url);
    }
    addGameData.img = file;
}
function changeFile(e) {
    addGameData.file = e.target.files[0];
}

const addGameForm = ref();
const errorText = ref('');
/** 新增遊戲 */
async function addGame() {
    if (!addGameForm.value.checkValidity()) {
        addGameForm.value.reportValidity();
        return;
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

    const res = await axios.post(adminAPI('game', 'addGame'), formData, {
        headers: {
            'Content-Type': 'multipart/form-data'
        }
    }).catch((err) => {
        console.log(err);
    })
    if (!res) { return; }
    if (res.data.status == 200) {
        // router.push('/admin/game/gameShow');
        console.log(res.data);
    } else {
        errorText.value = res.data.message;
    }
    console.log(res, addGameData);
    
}


</script>

<style lang="scss" scoped>
.form-control {
    border: 2px solid black;
}
.scrool{
    -webkit-overflow-scrolling: touch;
}

.req:has(+div>input:required)::after, .req:has(+div>textarea:required)::after {
    content: " *";
    color: red;
}
</style>