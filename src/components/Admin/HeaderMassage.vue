<template>
    <div :class="`alert alert-${messageData.color} mt-5 fs-3 fw-bolder`" role="alert">
       <span class="ms-5">{{ messageData.name }}</span>
    </div>
</template>

<script setup>
defineProps(['messageData']);
</script>

<style lang="scss" scoped>

</style>