<template>
	<button type="button" :class="[props.btnEvent.class === 'btn btn-primary'?'btn btn-primary':props.btnEvent.class]" @click="addShopping()">
        <Icon icon="typcn:shopping-cart" class=" d-inline-block me-2" />
        <span>{{ isBuy ? '已加入購物車' : '加入購物車' }}</span>
    </button>

	<!-- Modal 登入後 -->
	<div ref="modal" class="modal fade" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<!-- Modal 登入後 -->
			<div class="modal-content" v-if="account">
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
								<RouterLink to="/account/shopping/shoppingCar" >
									<button type="button" class="btn btn-secondary btn-lg w-100" data-bs-dismiss="modal" aria-label="Close">查看購物車</button>
								</RouterLink>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Modal 登入前 -->
			<div class="modal-content" v-else>
				<div class="modal-body text-center">
					<p class="modal-title fs-1 fw-bolder" id="cartModalLabel">尚未登入</p>
					<p class="fs-4 my-2">請先登入後再進行購買</p>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<div class="row">
							<div class="col-6">
								<button type="button" class="btn btn-outline-secondary w-100 fs-5 fw-bold" data-bs-dismiss="modal" aria-label="Close">取消</button>
							</div>
							<div class="col-6">
								<button type="button" class="btn btn-outline-primary w-100 fs-5 fw-bold" data-bs-dismiss="modal" aria-label="Close" 
									@click="router.push({path: '/login', query: { gameId: route.query.gameId }})">登入</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	
</template>

<script setup>
import { ref, nextTick, onMounted } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import { gameAPI, shopingAPI, numFormat, setting } from '../assets/JS/function';
import { useAccountStore } from '@/stores/account';
import axios from 'axios';

let props = defineProps(['btnEvent']);

let accountStore = useAccountStore();
const { tk, account } = storeToRefs(accountStore);

let getID = ref('');
let route = useRoute(); let router = useRouter();

const modal = ref();
async function addShopping() {
	if (!isBuy.value) {

		const res = await axios.post(gameAPI("addCard"), {
			"game_id": route.query.gameId,
			"token": `Bearer ${tk.value}`,
		}, setting).catch((err) => {
			console.log(err);
		})
		if (!res) { return; }
		console.log(res);
		
		if (res.data.status == 200) {
			getID.value = res.data.data;
			isBuy.value = true;
			nextTick(() => {
				const myModal = new bootstrap.Modal(modal.value);
				myModal.show();
			})
		}
	} else {
		router.push('/account/shopping/shoppingCar');
	}
}

const isBuy = ref(false);
onMounted(async () => {
	const showGameCard = await axios.post(shopingAPI("showCard"), {
		"game_id": route.query.gameId,
		"token": `Bearer ${tk.value}`,
	}, setting).catch((err) => {
		console.log(err);
	})
	if (!showGameCard) { return; }
	if (showGameCard.data.status == 200) {
		isBuy.value = true;
	}
	console.log(showGameCard);
	
})

// defineExpose({
// 	addShopping,
// })
</script>

<style lang="scss" scoped></style>