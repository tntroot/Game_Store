<template>
    <div class=" topDiv p-3" style="z-index:100" @click="topDiv">
        <Icon icon="bxs:to-top" class="fs-1 tw-text-[#FFFFFF]" />
    </div>
</template>

<script setup>

function topDiv() {
    window.scrollTo(0, 0);
}
</script>

<style lang="scss" scoped>
.topDiv{
	position: fixed;
    border-radius: 9999px;
    background-color: rgb(136, 127, 255);
    bottom: 10%;
    right: 10%;
    cursor: pointer;
}

.blue:hover{
	cursor:pointer;
}
</style>