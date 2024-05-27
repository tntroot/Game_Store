<script>
import ItemCard from '../components/ItemCard.vue';
export default {
	components: {
		ItemCard,
	},
	data() {
		return {
			item: {},
		}
	},
	async created() {
        
		const url1 = new URL("../assets/JSON/SearchList.json", import.meta.url);
		let data = await fetch(url1).then(res => res.json());
		let data2 = data.search.filter(item => item.id == this.$route.query.userId);

        /* 前端圖片轉址，後面用後端船就不須寫這段 */
        for (let i = 0; i < data2[0].img.length; i++){
            data2[0].img[i] = new URL(data2[0].img[i], import.meta.url);
        }
		this.item = data2[0];

	},
	mounted(){
		
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

        <div class="row mt-5">
            <div class=" bg-white p-4 w-100 rounded-4">
                <p class="h3">玩家評論</p>
				<div>
					<div class="">
						<img class="rounded-circle" src="../assets/img/account.png" width="50" alt="">
					</div>
				</div>
            </div>
        </div>
	</div>
</template>

<style lang="scss" scoped>
.h2, .h3 {
	border-bottom: 0.3rem solid #00d9ff;
	padding-bottom: 1rem;
    font-weight: bold;
}
table{
    tr > td:nth-child(1){
        width: 90px;
        table-layout: fixed;
    }
}
</style>

<!-- https://codesandbox.io/p/sandbox/qd6gyz?file=%2Findex.html%3A171%2C16-171%2C75 -->