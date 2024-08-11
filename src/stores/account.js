import { ref, computed } from 'vue'
import { defineStore } from 'pinia'

export const useAccountStore = defineStore('account', () => {
	const account = ref('');
    const isAccountAdmin = ref(0); // 會員、非會員、管理員 標頭 => 0、1、2
    const tk = ref('');
	function changeLogin(even) {
		account.value = even;
	}
	return {
		account,
        isAccountAdmin,
        tk,
		changeLogin
	}
},{
    persist: {
        key: "acctk",
        paths: ['account', 'tk', 'isAccountAdmin'],
        storage: localStorage,
    }
})
