<script>
import ItemCard from '../components/ItemCard.vue';
export default {
	components:{
		ItemCard,
	},
	data() {
		return {
			item: {
				"id": 1,
				"name": "Minecraft",
				"img": ["/src/assets/img/minecraft/minecraft.webp", "/src/assets/img/minecraft/minecraft2.jpg", "/src/assets/img/minecraft/minecraft3.jpg", "/src/assets/img/minecraft/minecraft4.jpg"],
				"price": 1000,
				"sale_price": 1000,
				"rating": 3.7,
				"sales": 123564,
				"message": 123
			}
		}
	},
	created() {
	},
}
</script>

<template>
	<div class=" container">
		<ItemCard :itemList="item" />
		<div class="row">
			<div class="col-12 bg-white rounded-5 p-5">
				<p class="h2">h1. Bootstrap heading</p>
			</div>
		</div>
	</div>
</template>

<style lang="scss" scoped>
	.h2{
		border-bottom: 0.3rem solid #00d9ff;
    	padding-bottom: 1rem;
	}
</style>

<!-- https://codesandbox.io/p/sandbox/qd6gyz?file=%2Findex.html%3A171%2C16-171%2C75 -->