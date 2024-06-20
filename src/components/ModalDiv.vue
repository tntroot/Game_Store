
<script setup>
import { ref } from 'vue';

let props = defineProps(['shop']);

const modal = ref();
function addShopping(item) {
	const myModal = new bootstrap.Modal(modal.value);
	if (item > 3) {
		myModal.show();
	} else {
		alert("商品數量不足")
	}
}

defineExpose({
	addShopping,
})
</script>

<template>
	<slot name="showShopping"></slot>

	<!-- Modal -->
	<div ref="modal" class="modal fade" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<p class="modal-title h2" id="cartModalLabel">遊戲已加入到購物車</p>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-6">
								<img :src="props.shop.img[0]" alt="" srcset="">
							</div>
							<div class="col-md-6">
								<p class="h3">{{ props.shop.name }}</p>
								<RouterLink to="/account/shoppingcar" >
									<button type="button" class="btn btn-secondary btn-lg w-100" data-bs-dismiss="modal" aria-label="Close">查看購物車</button>
								</RouterLink>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<style lang="scss" scoped></style>