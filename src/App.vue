<template>
    <HeaderNav v-if="accountStore.isAccountAdmin != 2 && !admin" />
    <AdminHeader v-if="admin" />
    <div class="min-vh-100">
        <RouterView></RouterView>

        <TopDiv />
    </div>
    <FooterDiv />
</template>

<script setup>
import { RouterView, RouterLink, useRoute } from 'vue-router'
import HeaderNav from './components/Header/HeaderNav.vue'
import AdminHeader from './components/Header/AdminHeader.vue';
import FooterDiv from './components/FooterDiv.vue';
import TopDiv from './components/TopDiv.vue';
import {useAccountStore} from './stores/account';
import { computed } from 'vue';

const accountStore = useAccountStore();

const route = useRoute();
const admin = computed(() => {
    return route.meta.isAdmin;
})
</script>

<style lang=""></style>
