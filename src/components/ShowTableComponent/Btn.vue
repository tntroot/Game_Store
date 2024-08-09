<template>
    <button class="btn btn-color px-4" @click="download(data)">
        <Icon class="d-inline-block fw-bolder" icon="line-md:download-outline-loop" />
        <span class="fw-bolder">下載</span>
    </button>
</template>

<script setup>
defineProps(['data']);

function download(files) {
    window.open(files)
}
</script>

<style lang="scss" scoped>
@import '@/assets/SASS/_repeat.scss';

.btn{
    &-color{
        @include btn-onClick(rgb(0, 179, 255));
    }

    &-hover{
        @include btn-onClick();
    }
}
</style>