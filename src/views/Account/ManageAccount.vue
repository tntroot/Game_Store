<template>
    <div class="container">
        <AccountHeader />
        <div class="position-relative">
            <RouterView />
        </div>
    </div>
</template>
    
<script setup>
    import { RouterView } from 'vue-router';
    import AccountHeader from "@/components/AccountHeader.vue";
</script>
    
<style>
    
</style>