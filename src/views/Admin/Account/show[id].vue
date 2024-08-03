<template>
    <div class="container">
        <HeaderMassage :messageData="messageModify('帳戶管理')" />

        <div class="row justify-content-center">
            <div class="col-6">
                <form class="row g-3 needs-validation justify-content-center bg-white p-5 fs-4 fw-bold" novalidate>
                    <div class="mb-3 row">
                        <div class="col-sm-2">暱稱: </div>
                        <div class="col-sm-10">13212131</div>
                    </div>
                    <div class="mb-3 row">
                        <div class="col-sm-2">帳號: </div>
                        <div class="col-sm-10">13212131</div>
                    </div>
                    <div class="mb-3 row">
                        <div class="col-sm-2">Email: </div>
                        <div class="col-sm-10">13212131</div>
                    </div>
                    <div class="mb-3 row">
                        <div class="col-sm-2">性別: </div>
                        <div class="col-sm-10">13212131</div>
                    </div>
                    <div class="mb-3 row">
                        <div class="col-sm-2">生日: </div>
                        <div class="col-sm-10">13212131</div>
                    </div>
                    <div class="mb-3 row">
                        <div class="col-sm-2">電話: </div>
                        <div class="col-sm-10">13212131</div>
                    </div>
                    <div class="mb-3 row">
                        <div class="col-sm-2">權限: </div>
                        <div class="col-sm-10">
                            <input type="radio" name="member" id="member0" value="0" class="form-check-input me-2">
                            <label for="member0" class="form-check-label me-4 tw-cursor-pointer">管理員</label>
                            <input type="radio" name="member" id="member2" value="2" class="form-check-input me-2">
                            <label for="member2" class="form-check-label me-2 tw-cursor-pointer">會員</label>
                        </div>
                    </div>
                    <div class="col text-center">
                        <button type="submit" class="btn btn-primary btn-lg">確認修改</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</template>

<script setup>
import HeaderMassage from '@/components/Admin/HeaderMassage.vue';
import AdminHeadermessage from '@/hook/AdminHeaderMassage';

const { messageModify } = AdminHeadermessage();
</script>

<style lang="scss" scoped></style>