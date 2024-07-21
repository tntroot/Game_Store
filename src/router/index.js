import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import Cookies from 'js-cookie';
import axios from 'axios';
import { getAccountAPI, setting } from '../assets/JS/function';
import { useAccountStore } from '../stores/account';

const SearchView = () => import('../views/SearchView.vue');
const SignUpView = () => import('../views/SignUpView.vue');
const ItemView = () => import('../views/ItemView.vue');
const LoginView = () => import('../views/LoginView.vue');
const ShoppingCarView = () => import('../views/Account/ShoppingCarView.vue');
const CheckoutView = () => import('../views/Account/CheckoutView.vue');
const CheckoutCompleteView = () => import('../views/Account/CheckoutCompleteView.vue');
const SignOutView = () => import('../views/Account/SignOutView.vue');

const router = createRouter({
	// history: createWebHistory(import.meta.env.BASE_URL),
	history: createWebHistory("/113-1-11"),
	routes: [
		{
			path: '/',
			name: 'home',
            meta: {
                title: '夢幻宇宙網',
            },
			component: HomeView
		},
		{
			path: '/search',
			name: 'Search',
            meta: {
                title: '搜尋',
            },
			component: SearchView,
		},
		{
			path: '/search/item',
			name: 'SearchItem',
			component: ItemView
		},
		{
			path: '/account',
			name: 'Account',
			meta: {
				isMember: "account",
			},
			children: [
				{
					path: 'shoppingCar',
                    meta: {
                        title: '購物車',
                    },
					component: ShoppingCarView
				},
				{
					path: 'checkout',
                    meta: {
                        title: '結帳',
                    },
					component: CheckoutView
				},
				{
					path: 'checkoutComplete',
                    meta: {
                        title: '結帳完成',
                    },
					component: CheckoutCompleteView
				}
			]
		},
		{
			path: '/login',
			name: 'Login',
            meta: {
                title: '登入',
            },
			component: LoginView
		},
		{
			path: '/signUp',
			name: 'SignUp',
            meta: {
                title: '註冊',
            },
			component: SignUpView
		},
        {
            path: '/signOut',
            name: 'SignOut',
            meta: {
                title: '登出',
            },
            component: SignOutView
        },
	]
})

router.beforeEach( async (to, from, next) => {

    // 表投更改
    document.title = `${to.meta.title || '夢幻宇宙網'}`;

    const accountStore = useAccountStore();
    accountStore.signOut = false;

	if (to.name != "SignOut") {

		let UUID = Cookies.get('UUID') ? Cookies.get('UUID') : '';
		const checkLogin = await axios.post(getAccountAPI('checkAccount'),
        {
			"token": `Bearer ${UUID}`
		}, setting).catch((err) => {
			console.log(err);
		});

		if(checkLogin){
			if(checkLogin.data.status == 200){
				accountStore.account = checkLogin.data.data.account;
				next();
			}else{
                accountStore.account = '';
                /* 判別是否在會員頁面，若是則跳轉至首頁 */
				to.meta.isMember == "account" ? next("/login") : next();
			}
		}else{
            accountStore.account = '';
            /* 判別是否在會員頁面，若是則跳轉至首頁 */
			to.meta.isMember == "account" ? next("/login") : next();
		}
	} else {
        accountStore.account = '';
        
        if(to.name == 'SignOut'){
            accountStore.signOut = true;
        }
		next();
	}
})

export default router
