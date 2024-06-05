<script>
import CardDiv from '../components/CardDiv.vue'
export default {
    components: {
        CardDiv
    },
    data() {
        return {
            list: [],
            changeList: []
        }
    },
    methods: {
        close(index) {
            this.changeList = this.changeList.filter((item) => item != index)
        },
        resple() {
            this.changeList = []
            Object.values(this.$route.query).forEach((item, index, values) => {
                if (item !== 'all') {
                    if (item) {
                        this.changeList.push(item)
                    }
                }
            })
        }
    },
    async created() {
        const urlEl = new URL('../assets/JSON/SearchList.json', import.meta.url)
        const searchList = await fetch(urlEl).then((res) => res.json())

        this.list = searchList
        this.resple()
    },
    watch: {
        $route: {
            handler: 'resple',
            immediate: false,
            deep: true
        }
    }
}
</script>

<template>
    <div class="container">
        <div class="row mt-5 mb-3">
            <div class="col-12">
                <h3 class="tw-border-b-4 rounded-3 border-primary mb-4">
                    <p class="badge bg-primary rounded-bottom-0 p-3 ms-4 fs-6">查詢結果</p>
                </h3>
                <div>
                    <span
                        class="badge bg-secondary fs-5 m-2 tw-cursor-pointer"
                        v-for="(item, index) in changeList"
                        @click="close(item)"
                        :key="index"
                        >{{ item }}
                        <button
                            type="button"
                            class="btn-close btn-close-white"
                            aria-label="Close"
                        ></button
                    ></span>
                </div>
            </div>
        </div>
        <div class="row row-cols-1 row-cols-sm-2 row-cols-lg-4 g-4">
            <div class="col" v-for="(item, index) in list.search" :key="item.id">
                <CardDiv :thisCard="item" />
            </div>
        </div>
    </div>
</template>

<style lang="scss" scoped></style>
