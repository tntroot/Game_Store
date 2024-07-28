import { ref, computed } from 'vue'
import { defineStore } from 'pinia'

export const useAccountStore = defineStore('account', () => {
	const account = ref('');
    const signOut = ref(false);
    const tk = ref('');
	function changeLogin(even) {
		account.value = even;
	}
	return {
		account,
        signOut,
        tk,
		changeLogin
	}
},{
    persist: {
        key: "acctk",
        paths: ['account', 'tk'],
        storage: localStorage,
    }
})
