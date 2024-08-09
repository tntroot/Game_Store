<template>
    <div class="nav nav-tabs my-5">
        <RouterLink class="nav-item nav-link fs-3 fw-bolder" :class="[checkPwd ? 'router-link-active' : '']" to="/account/manageAccount/account">我的帳號</RouterLink>
        <RouterLink class="nav-item nav-link fs-3 fw-bolder " to="/account/manageAccount/buyHistory">購買紀錄</RouterLink>
    </div>
</template>
    
<script setup>
    import { ref, watch, computed } from 'vue';
    import { useRoute } from 'vue-router';

    const checkPwd = ref(false);
    watch(useRoute(),(newValue) => {
        if (newValue.path == '/account/manageAccount/changePwd') {
            checkPwd.value = true;
        }else{
            checkPwd.value = false;
        }
    },{ deep: true, immediate: true });
</script>
    
<style scoped>
    /* 連結高亮 */
    .router-link-active {
        background-color: rgb(218, 218, 218);
        padding: 0.5rem 2rem;
    }
</style>
