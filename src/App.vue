<template>
    <HeaderNav v-if="!accountStore.signOut" />
    <div class="min-vh-100">
        <RouterView></RouterView>
    </div>
    <FooterDiv />
</template>

<script setup>
import { RouterView, RouterLink } from 'vue-router'
import HeaderNav from './components/HeaderNav.vue'
import FooterDiv from './components/FooterDiv.vue'
import {useAccountStore} from './stores/account';

const accountStore = useAccountStore();
</script>

<style lang=""></style>
