<template>
    <div class="table-responsive w-100">
        <table class="table table-hover table-bordered align-middle">
            <thead class="table-primary">
                <tr>
                    <th class="text-center" v-for="(item, index) in head" :key="index">{{ item }}</th>
                    <th class="text-center"></th>
                </tr>
            </thead>
            <tbody class="table-light" v-if="isdata">
                <tr v-for="(item, index) in body" :key="index">
                    <td class="text-center" v-for="(item2, index2) in item" :key="index2" :width="index2 == 'img' ? '15%' : ''">
                        <component :is="index2 == 'img' ? ImgPath : index2 == 'files' ? Btn : 'span'" :data="item2">{{ item2 }}</component>
                    </td>
                    <td class="text-center">
                        <slot name="btn" :item="item"></slot>
                    </td>
                </tr>
            </tbody>
            <tbody class="table-light" v-else>
                <tr>
                    <td class="text-center" :colspan="head.length + 1">{{ body }}</td>
                </tr>
            </tbody>
        </table>
    </div>
</template>

<script setup>
import ImgPath from '@/components/ShowTableComponent/ImgPath.vue';
import Btn from '@/components/ShowTableComponent/Btn.vue';
const { head, body, isdata } = defineProps(['head', 'body', 'isdata']);

</script>

<style lang="scss" scoped></style>