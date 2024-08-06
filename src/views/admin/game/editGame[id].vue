<template>
    <div class="container">
        <HeaderMassage :messageData="messageModify('修改遊戲')" />
        
    </div>
</template>

<script setup>
import HeaderMassage from '@/components/Admin/HeaderMassage.vue';
import AdminHeadermessage from '@/hook/AdminHeaderMassage';

const { messageModify } = AdminHeadermessage();
</script>

<style lang="scss" scoped>

</style>