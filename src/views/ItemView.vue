<script>
import { RouterLink } from 'vue-router';
import { Icon } from '@iconify/vue';
export default {
	components:{
		Icon,
	},
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
					<div class="col-md-6">
						<swiper-container class="mySwiper" thumbs-swiper=".mySwiper2" space-between="10" navigation="true">
							<swiper-slide v-for="(item, index) in itemList.img" :key="index">
								<img class="w-100 lg:tw-h-[24rem] tw-h-[12rem]" :src="item" alt="" srcset="">
							</swiper-slide>
						</swiper-container>
						<swiper-container class="mySwiper2" space-between="10" slides-per-view="3" free-mode="true"
							watch-slides-progress="true">
							<swiper-slide v-for="(item, index) in itemList.img" :key="index">
								<img class="w-100 sm:tw-h-[6rem] tw-h-[3rem]" :src="item" alt="" srcset="">
							</swiper-slide>
						</swiper-container>
					</div>
					<div class="col-md-6">
						<div class="card-body">
							<h1 class="card-title">Minecraft</h1>
							<table class="card-text itemTable">
								<tr>
									<td>作者：</td>
									<td>凱薩</td>
								</tr>
								<tr>
									<td>遊戲類型：</td>
									<td>角色扮演</td>
								</tr>
								<tr>
									<td>上架時間：</td>
									<td><small class="text-muted">2024/05/16</small></td>
								</tr>
								<tr>
									<td>遊戲標籤：</td>
									<td>
										<div class="d-flex flex-wrap">
											<div v-for="(item, index) in ['3D', '可愛']">
												<RouterLink to="/">
													<span class=" tw-text-blue-600 hover:tw-text-red-600">{{ item }}</span>
													<span v-if="['3D', '可愛'].length !== index + 1">、</span>
												</RouterLink>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										價格：
									</td>
									<td>
										$ 1234
									</td>
								</tr>
							</table>
							<div class="btn btn-outline-dark mt-3 fw-bolder">
								<Icon icon="typcn:shopping-cart" class=" d-inline-block me-2" />
								<span>加入購物車</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<style lang="scss" scoped>
.mySwiper2 {
	padding: 0.8rem;
	background-color: rgba(0, 0, 0, 0.911);

	img {
		cursor: pointer;
	}
}
.card-title{
	border-bottom: 0.3rem solid #00d9ff;
	padding-bottom: 1rem;
}
.itemTable{
	margin: 2.5rem;
	font-size: 1.5rem;
	tr > td:nth-child(2){
		padding: 0.3rem 0 0.3rem 1.5rem;
	}
}
</style>

<!-- https://codesandbox.io/p/sandbox/qd6gyz?file=%2Findex.html%3A171%2C16-171%2C75 -->