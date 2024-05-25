<script>
import { RouterView, RouterLink } from 'vue-router';
import HeaderNav from './components/HeaderNav.vue';
import FooterDiv from './components/FooterDiv.vue';
export default {
	components: {
		HeaderNav, FooterDiv,
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
	<FooterDiv />
</template>

<style lang="">

</style>