<script>
import { RouterLink } from 'vue-router';
export default {
	data() {
		return {
			itemList: {
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
		// this.itemList.img.map( item => {item = new URL(item, import.meta.url)});
	},
}
</script>

<template>
	<div class=" container">
		<div class="row my-5">
			<div class="card mb-3">
				<div class="row g-0">
					<div class="col-md-4">
						<swiper-container class="mySwiper" thumbs-swiper=".mySwiper2" space-between="10" navigation="true">
							<swiper-slide v-for="(item, index) in itemList.img" :key="index">
								<img class="w-100 tw-h-[18rem]" :src="item" alt="" srcset="">
							</swiper-slide>
						</swiper-container>
						<swiper-container class="mySwiper2" space-between="10" slides-per-view="4" free-mode="true"
						watch-slides-progress="true">
							<swiper-slide v-for="(item, index) in itemList.img" :key="index">
								<img class="tw-w-[6rem] tw-h-[6rem]" :src="item" alt="" srcset="">
							</swiper-slide>
						</swiper-container>
					</div>
					<div class="col-md-8">
						<div class="card-body">
							<h1 class="card-title">Minecraft</h1>
							<table class=" card-text">
								<tr>
									<td>作者：</td>
									<td>凱薩</td>
								</tr>
								<tr>
									<td>遊戲類型：</td>
									<td>角色扮演</td>
								</tr>
								<tr>
									<td>遊戲標籤：</td>
									<td>
										<RouterLink to="/">
											<span class=" tw-text-blue-600 hover:tw-text-red-600">3D</span>
										</RouterLink>、
										<RouterLink to="/">
											<span class=" tw-text-blue-600 hover:tw-text-red-600">可愛</span>
										</RouterLink>
									</td>
								</tr>
								<tr>
									<td>上架時間：</td>
									<td><small class="text-muted">2024/05/16</small></td>
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
.mySwiper2{
	padding: 0.8rem;
	background-color: rgba(0, 0, 0, 0.911);

	img{
		cursor: pointer;
	}
}
</style>

<!-- https://codesandbox.io/p/sandbox/qd6gyz?file=%2Findex.html%3A171%2C16-171%2C75 -->