<template>
    <div class="table-responsive">
        <table class="table table-hover table-bordered">
            <thead class="table-primary">
                <tr>
                    <th class="text-center" v-for="(item, index) in head" :key="index">{{ item }}</th>
                    <th class="text-center"></th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(item, index) in body" :key="index">
                    <td class="text-center" v-for="(item2, index2) in item" :key="index2">{{ item2 }}</td>
                    <td class="text-center">
                        <slot name="btn" :item="item"></slot>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</template>

<script setup>
defineProps(['head', 'body']);
</script>

<style lang="scss" scoped></style>