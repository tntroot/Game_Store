<template>
    <div class="container">
        <HeaderMassage :messageData="messageModify('修改遊戲')" />
        
        <div class="row justify-content-center  needs-validation">
            <div class="col-8">
                <form ref="addGameForm" class="row  g-3 justify-content-center bg-white p-5 fs-4 fw-bold"
                    @submit.prevent="editG" novalidate>
                    <div class="mb-3 row">
                        <div class="col-4 req">遊戲名稱: </div>
                        <div class="col-8">
                            <input type="text" class="form-control px-3" required v-model="addGameData.name">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <div class="col-4 req">價格: </div>
                        <div class="col-8">
                            <span class="me-3">NT$</span>
                            <input type="number" class="form-control d-inline px-3 tw-w-fit" required
                                v-model="addGameData.price" :pattern="addGameData.price >= 0">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <div class="col-4">是否特價: </div>
                        <div class="col-8">
                            <input type="checkbox" class="form-check-input me-3 tw-cursor-pointer" v-model="isspecial"
                                @click="addGameData.sale_price = addGameData.price">
                            <div v-show="isspecial">
                                <span>請填寫特價價格: </span>
                                <input type="number" class="form-control d-inline px-3 tw-w-fit"
                                    v-model="addGameData.sale_price" :pattern="addGameData.sale_price >= 0">
                            </div>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <div class="col-4">
                            <p>遊戲類型:</p>
                            <p class="fs-5">(複選請用 ctrl 鍵點擊)</p>
                        </div>
                        <div class="col-8">
                            <span v-for="(item, index) in addGameData.type" :key="index" class="me-2">{{ item}}{{ index == addGameData.type.length - 1 ? '' : ',' }}</span>
                            <select class="form-select px-3 my-3" multiple v-model="addGameData.type" size="5">
                                <option v-for="(item, index) in gameType" :key="index" :value="item" class="fs-5">
                                    {{ item }}
                                </option>
                            </select>
                            <span class="text-secondary fs-5">(若沒有，請添加) </span>
                            <input type="text" class="form-control d-inline-block tw-w-fit px-3" v-model.trim="addType">
                            <button type="button" class="btn btn-primary fw-bold ms-2" @click="addGameType">添加</button>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <div class="col-4 req">遊戲檔案: </div>
                        <div class="col-8">
                            <input type="file" accept=".zip, .rar, .7z" class="form-control px-3"
                                @change="changeFile">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <div class="col-4 req">遊戲圖片: </div>
                        <div class="col-8">
                            <swiper-container class=" tw-cursor-grab" direction="horizontal" slides-per-view="3"
                                space-between="10">
                                <swiper-slide v-for="(item, index) in imgPreview" :key="index">
                                    <img :src="item" width="150" height="150" alt="" class="d-inline-block img-fluid">
                                </swiper-slide>
                            </swiper-container>
                            <input type="file" accept="image/*" multiple class="form-control px-3 mt-3"
                                @change="changeImg">
                            <span class="text-secondary fs-5">(ex: 第一張為遊戲封面)</span>
                        </div>
                    </div>
                    <div class="mb-3 row req">
                        <div class="col-4 req">遊戲介紹: </div>
                        <div class="col-8">
                            <textarea name="" id="" cols="30" rows="10" class="form-control" required
                                v-model="addGameData.content"></textarea>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <div class="col-4">遊戲配置: </div>
                        <div class="col-8"></div>
                    </div>
                    <div class="mb-3 row">
                        <div class="col-12">
                            <table class="table table-bordered ms-5 w-50">
                                <tr>
                                    <td>作業系統：</td>
                                    <td><input type="text" class="form-control px-3" v-model="addGameData.system">
                                    </td>
                                </tr>
                                <tr>
                                    <td>處理器：</td>
                                    <td><input type="text" class="form-control px-3" v-model="addGameData.cpu">
                                    </td>
                                </tr>
                                <tr>
                                    <td>記憶體 :</td>
                                    <td><input type="text" class="form-control px-3" v-model="addGameData.ram">
                                    </td>
                                </tr>
                                <tr>
                                    <td>顯示卡 :</td>
                                    <td><input type="text" class="form-control px-3" v-model="addGameData.display_card">
                                    </td>
                                </tr>
                                <tr>
                                    <td>directX :</td>
                                    <td><input type="text" class="form-control px-3" v-model="addGameData.directX">
                                    </td>
                                </tr>
                                <tr>
                                    <td>所需空間 :</td>
                                    <td><input type="text" class="form-control px-3" v-model="addGameData.rom">
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="col text-center">
                        <RouterLink to="/admin/game/gameShow" class="btn btn-secondary btn-lg me-3">回上一頁</RouterLink>
                        <button type="submit" class="btn btn-primary btn-lg">確認修改</button>
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
import axios from 'axios';
import { onMounted, reactive } from 'vue';
import { useRoute } from 'vue-router';
import { adminAPI, setting } from '@/assets/JS/function.js';

import useEditGame from '@/hook/useEditGame';
import useGameType from '@/hook/useGameType';

const { messageModify } = AdminHeadermessage();

const { isspecial, imgPreview, addGameData, changeImg, changeFile, addGameForm, errorText, addGame, router } = useEditGame();
const { gameType, addType, addGameType } = useGameType();

const route = useRoute();
onMounted( async() => {
    const id = route.params.id;
    const res = await axios.post(adminAPI('game', 'getGameContent'), { "game_id": id }, setting).catch((err) => {
        console.log(err);
    })

    if(!res) { router.push('/admin/game/gameShow'); };
    if (res.data.status == 200) {
        const { name, price, sale_price, type, content, system, cpu, ram, display_card, directX, rom, img } = res.data.data;
        addGameData.name = name;
        addGameData.price = price;
        addGameData.sale_price = sale_price;
        addGameData.type = type;
        addGameData.content = content;
        addGameData.system = system;
        addGameData.cpu = cpu;
        addGameData.ram = ram;
        addGameData.display_card = display_card;
        addGameData.directX = directX;
        addGameData.rom = rom;

        imgPreview.value = img;
    }else{
        router.push('/admin/game/gameShow');
    }
});

function editG(){
    addGame(['game', 'editGame'], route.params.id)
    // console.log(addGameData);
    
}
</script>

<style lang="scss" scoped>

</style>