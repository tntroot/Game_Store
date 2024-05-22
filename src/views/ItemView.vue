<script>
import ItemCard from '../components/ItemCard.vue';
export default {
	components: {
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
				"message": 123,
				"sysReq": {
					"最低配置": {
						"Window": "Window 10",
						"CPU": "Intnet Core i5 2.8 GHz",
						"RAM": "8GB",
						"Display_Card": "Nvida GeForce GTX 660",
						"DirectX": "11",
						"ROM": "6GB"
					},
					"建議配置": {
						"Window": "Window 10",
						"CPU": "Intnet Core i5 2.8 GHz",
						"RAM": "9GB",
						"Display_Card": "Nvida GeForce GTX 660",
						"DirectX": "11",
						"ROM": "6GB"
					}
				}
			}
		}
	},
	created() {
	},
	mounted(){
		console.log(this.$route);
	}
}
</script>

<template>
	<div class=" container">
		<ItemCard :itemList="item" />
		<div class="row">
			<div class="col-12 bg-white rounded-4 p-3">
				<p class="h2">遊戲內容</p>
				<div id="Game_Content">

				</div>
				<p class="h2">系統需求</p>
				<div id="Sys_Require">
					<div class="row">
						<div class="col-md-6" v-for="(item1, index1) in item.sysReq">
							<p class="h5 fw-bolder">{{ index1 + " :" }}</p>
							<table >
								<tr>
									<td>作業系統：</td>
									<td>{{ item1.Window }}</td>
								</tr>
								<tr>
									<td>處理器：</td>
									<td>{{ item1.CPU }}</td>
								</tr>
								<tr>
									<td>記憶體：</td>
									<td>{{ item1.RAM }}</td>
								</tr>
								<tr>
									<td>顯示卡：</td>
									<td>{{ item1.Display_Card }}</td>
								</tr>
								<tr>
									<td>DirectX：</td>
									<td>{{ item1.DirectX }}</td>
								</tr>
								<tr>
									<td>所需空間：</td>
									<td>{{ item1.ROM }}</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<style lang="scss" scoped>
.h2 {
	border-bottom: 0.3rem solid #00d9ff;
	padding-bottom: 1rem;
}
table{
	table-layout: fixed;
}
</style>

<!-- https://codesandbox.io/p/sandbox/qd6gyz?file=%2Findex.html%3A171%2C16-171%2C75 -->