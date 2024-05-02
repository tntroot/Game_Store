<script>
import { RouterView, RouterLink } from 'vue-router';
import HeaderNav from './components/HeaderNav.vue';
export default {
	components: {
		HeaderNav,
	},
	data() {
		return {

		}
	},
}
</script>
<template>
	<HeaderNav />
	<div>
		<RouterView></RouterView>
	</div>
</template>

<style lang="">

</style>