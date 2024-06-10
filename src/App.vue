<script setup>
import { RouterView, RouterLink } from 'vue-router'
import HeaderNav from './components/HeaderNav.vue'
import FooterDiv from './components/FooterDiv.vue'
</script>
<template>
    <HeaderNav />
    <div class="min-vh-100">
        <RouterView></RouterView>
    </div>
    <FooterDiv />
</template>

<style lang=""></style>
