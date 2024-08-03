<template>
    <div class="table-responsive">
        <table class="table table-hover table-bordered align-middle">
            <thead class="table-primary">
                <tr>
                    <th class="text-center" v-for="(item, index) in head" :key="index">{{ item }}</th>
                    <th class="text-center"></th>
                </tr>
            </thead>
            <tbody class="table-light" v-if="body">
                <tr v-for="(item, index) in body.value" :key="index">
                    <td class="text-center" v-for="(item2, index2) in item" :key="index2">{{ item2 }}</td>
                    <td class="text-center">
                        <slot name="btn" :item="item"></slot>
                    </td>
                </tr>
            </tbody>
            <tbody class="table-light" v-else>
                <tr>
                    <td class="text-center" :colspan="head.length + 1">{{ body.status }}</td>
                </tr>
            </tbody>
        </table>
    </div>
</template>

<script setup>
const { head, body } = defineProps(['head', 'body']);
</script>

<style lang="scss" scoped></style>