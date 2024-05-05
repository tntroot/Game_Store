<script>
    import CardDiv from "../components/CardDiv.vue";
    export default {
        components: {
            CardDiv,
        },
        data() {
            return {
                list: [{
                    id: 1, name: "Minecraft", img: "../assets/img/minecraft.webp", price: 1000, rating: 3.7, scale: 100000, message: 123,
                },{
                    id: 2, name: "asd", img: "../assets/img/minecraft.webp", price: 1000, rating: 3.7, scale: 100000, message: 123,
                },{
                    id: 3, name: "xxcc", img: "../assets/img/minecraft.webp", price: 1000, rating: 3.7, scale: 100000, message: 123,
                },{
                    id: 4, name: "aadscc", img: "../assets/img/minecraft.webp", price: 1000, rating: 3.7, scale: 100000, message: 123,
                },{
                    id: 5, name: "wweqe", img: "../assets/img/minecraft.webp", price: 1000, rating: 3.7, scale: 100000, message: 123,
                },{
                    id: 6, name: "hjfrr", img: "../assets/img/minecraft.webp", price: 1000, rating: 3.7, scale: 100000, message: 123,
                },]
            }
        },
    }
</script>

<template>
    <header class="bg-dark px-5 tw-py-[3rem] sm:tw-py-[6rem] text-center">
        <h1 class="tw-text-6xl fw-bolder tw-text-[#1efce6]">遊戲商店</h1>
        <p class="display-6 lead fw-bolder tw-text-white mb-0">你想玩的遊戲都在這裡</p>
    </header>
    <div class="container">
        <div class="row my-4">
            <h3 class="tw-border-b-4 rounded-3 border-primary mb-4">
                <p class="badge bg-primary rounded-bottom-0 p-3 fs-6">最新遊戲</p>
            </h3>

            <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel" data-bs-touch="true">
                <div class="carousel-inner" id="a1">
                    <div v-for="(item, index) in list" :key="item.id" :class="[index == 0 ? 'carousel-item active':'carousel-item']" >
                        <CardDiv :thisCard="item" />
                    </div>
                    <!-- <div class="carousel-item active">
                        <CardDiv :thisCard="list" />
                    </div>
                    <div class="carousel-item">
                        <CardDiv :thisCard="list" />
                    </div>
                    <div class="carousel-item">
                        <CardDiv :thisCard="list" />
                    </div> -->
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls"
                    data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next " type="button" data-bs-target="#carouselExampleControls"
                    data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
        <div class="row">
            <h3 class="tw-border-b-4 rounded-3 border-danger">
                <p class="badge bg-danger rounded-bottom-0 p-3 fs-6">促銷遊戲</p>
            </h3>
        </div>
        <div class="row">
            <h3 class="tw-border-b-4 rounded-3 border-info">
                <p class="badge bg-info rounded-bottom-0 p-3 fs-6">人氣遊戲</p>
            </h3>
        </div>
    </div>
</template>

<style lang="scss" scoped>
    header {
        background: url("../assets/img/advertise.jpg");
        background-position: 0 40%;
        background-size: 100%;
        text-shadow: 4px 3px 1px purple, -3px -1px 1px purple;
    }

    .carousel-control-prev, .carousel-control-next{
        width: 10vh;
        height: 10vh;
        background-color: #8a8a8a9c;
        top: 50%;
        transform: translateY(-50%);
        border-radius: 9999px;
        padding: 6px;
    }

    @media screen and (min-width: 576px) {
        .carousel-inner{
            display: flex;
        }
        .carousel-item{
            display: block;
            margin-right: 0;
            flex: 0 0 calc(100%/3);
            flex-basis: calc(100% / 3);
        }
    }
</style>