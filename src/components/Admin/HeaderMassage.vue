<template>
    <div class="alert alert-primary" role="alert">
        {{ massageData.name }}
    </div>
</template>

<script setup>
defineProps(['massageData']);
</script>

<style lang="scss" scoped>

</style>