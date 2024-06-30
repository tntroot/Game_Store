
<script setup>
import { ref, nextTick } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import { numFormat } from '../assets/JS/NumberFormat'

let props = defineProps(['btnEvent']);

const modal = ref();
function addShopping() {
	if (!props.btnEvent.isBuy) {
        nextTick(() => {
            const myModal = new bootstrap.Modal(modal.value);
            myModal.show();
        })
	} else {
		router.push('/account/shoppingCar');
	}
}

let getID = ref('');
let route = useRoute();
let router = useRouter();
async function getIDNum() {
    if(!route.query.userId){return};
    const url1 = new URL('../assets/JSON/SearchList.json', import.meta.url)
    let data = await fetch(url1).then((res) => res.json())
    let data2 = data.search.filter((item) => item.id == route.query.userId);
    data2[0].img = data2[0].img[0];
    /* 前端圖片轉址，後面用後端船就不須寫這段 */
    data2[0].img = new URL(`../assets/img/${data2[0].img}`, import.meta.url)
    numFormat(data2[0])
    getID.value = data2[0]
}
getIDNum();

defineExpose({
	addShopping,
})
</script>

<template>
	<button type="button" :class="[props.btnEvent.class === 'btn btn-primary'?'btn btn-primary':props.btnEvent.class]" @click="addShopping()">
        <Icon icon="typcn:shopping-cart" class=" d-inline-block me-2" />
        <span>{{ props.btnEvent.isBuy ? '已加入購物車' : '加入購物車' }}</span>
    </button>

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
								<img :src="getID.img" alt="" srcset="">
							</div>
							<div class="col-md-6">
								<p class="h3">{{ getID.name }}</p>
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