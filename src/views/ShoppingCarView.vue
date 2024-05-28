<script>
export default {
    data() {
        return {

        }
    },
}
</script>

<template>
    <div class="container">
        <div class="row">
            <div class="col-sm-10">
                <div class="tw-bg-[#123456] my-5 rounded-4" v-for="item in [1, 2, 3]">
                    <div class="d-flex justify-content-between align-items-center tw-text-[white]">
                        <div class="d-flex">
                            <img src="../assets/img/A_Dance_of_Fire_and_Ice/A_Dance_of_Fire_and_Ice.jpg"
                                class="tw-w-[12rem] tw-h-[8rem]" alt="" srcset="">
                            <div>
                                <p class="h2 tw-font-bold ps-4 pt-3">冰與火之舞</p>
                            </div>
                        </div>
                        <div>
                            <p class="h3 tw-font-bold pe-4">NT$ 123</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-2">
                <div class="p-4 tw-bg-[#123456]">
                    
                </div>
            </div>
        </div>
    </div>
</template>

<style lang="">
    
</style>