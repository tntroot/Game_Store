<template>
    <div class="container">
        <HeaderMassage :messageData="messageAdd('新增帳戶')" />
    </div>
</template>

<script setup>
import HeaderMassage from '@/components/Admin/HeaderMassage.vue';
import AdminHeadermessage from '@/hook/AdminHeaderMassage';

const {messageAdd } = AdminHeadermessage();

</script>

<style lang="scss" scoped>

</style>