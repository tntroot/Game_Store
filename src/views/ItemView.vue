<script>
import { RouterLink } from 'vue-router';
export default {
	data() {
		return {

		}
	},
	mounted() {
		const swiperEl = document.querySelectorAll('swiper-container');

		// swiper parameters
		const swiperParams = {
			direction: 'horizontal', // 方向 vertical 垂直、horizontal 橫向
			navigation: true, // 前後退啟用按鈕
			slidesOffsetAfter: 0, // 與前後退按鈕間隔距離
			slidesOffsetBefore: 0, // 與前後退按鈕間隔距離
			breakpoints: {  // 響應式
				0: {
					slidesPerView: 1, // 顯示數量
					slidesPerGroup: 1, // 滑動時移動的格數
				},
				400: {
					slidesPerView: 2,
					slidesPerGroup: 1,
				},
				750: {
					slidesPerView: 3,
					slidesPerGroup: 2,
				},
				100: {
					slidesPerView: 4,
					slidesPerGroup: 3,
				},
				1300: {
					slidesPerView: 5,
					slidesPerGroup: 4,
				}
			},
			on: { // 按件事件
				init() {
					// ...
				}
			}
		}

		// 淺層複製到 swiperEl
		Object.assign(swiperEl, swiperParams);

		// 初始化 swiper
		swiperEl.initialize();
	}
}
</script>

<template>
	<div class=" container">
		<div class="row my-5">
			<div class="card mb-3">
				<div class="row g-0">
					<div class="col-md-4">
						<swiper-container init="false">
							<swiper-slide v-for="(item, index) in listAll" :key="item.id">
								<CardDiv :thisCard="item" />
							</swiper-slide>
						</swiper-container>
					</div>
					<div class="col-md-8">
						<div class="card-body">
							<h1 class="card-title">冰與火之舞</h1>
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
										<RouterLink>
											<span class=" tw-text-blue-600 hover:tw-text-red-600">3D</span>
										</RouterLink>、
										<RouterLink>
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

<style lang="scss" scoped></style>