import { createRouter, createWebHistory } from 'vue-router'
import Cookies from 'js-cookie';
import axios from 'axios';
import { getAccountAPI, setting } from '../assets/JS/function';
import { useAccountStore } from '../stores/account';

// 首頁
const HomeView = () => import('../views/HomeView.vue');

// 搜尋 + 商品
const SearchView = () => import('../views/SearchView.vue');
const ItemView = () => import('../views/ItemView.vue');

// 帳號管理 --> 帳號資訊、購買紀錄
const ManageAccountView = () => import('../views/Account/ManageAccount.vue');
const AccountView = () => import('../views/Account/ManageAccount/AccountView.vue');
const ChangePwd = () => import('../views/Account/ManageAccount/ChangePwd.vue');
const ShopHistoryView = () => import('../views/Account/ManageAccount/ShopHistoryView.vue');

// 購物車 + 付款
const ShoppingCarView = () => import('../views/Account/Shopping/ShoppingCarView.vue');
const CheckoutView = () => import('../views/Account/Shopping/CheckoutView.vue');
const CheckoutCompleteView = () => import('../views/Account/Shopping/CheckoutCompleteView.vue');

// 註冊 + 登入
const SignUpView = () => import('../views/SignUpView.vue');
const LoginView = () => import('../views/LoginView.vue');
const SignOutView = () => import('../views/Account/SignOutView.vue');

// 新增遊戲
const AdminView = () => import('../views/Admin/AdminView.vue');

// 404
const NotFoundView = () => import('../views/NotFound.vue');

const router = createRouter({
    // history: createWebHistory(import.meta.env.BASE_URL),
    history: createWebHistory("/113-1-11"),
    routes: [
        {  // 首頁
            path: '/',
            name: 'home',
            meta: {
                title: '夢幻宇宙網',
            },
            component: HomeView,
        },
        {  // 搜尋
            path: '/search',
            name: 'Search',
            meta: {
                title: '搜尋',
            },
            component: SearchView,
        },
        {  // 搜尋商品
            path: '/search/item',
            name: 'SearchItem',
            component: ItemView
        },
        // 帳號 + 購物車
        {
            path: '/account/shoppingCar',
            meta: {
                title: '購物車',
                isMember: "account",
            },
            component: ShoppingCarView,
        },
        {
            path: '/account/checkout',
            meta: {
                title: '結帳',
                isMember: "account",
            },
            component: CheckoutView
        },
        {
            path: '/account/checkoutComplete',
            meta: {
                title: '結帳完成',
                isMember: "account",
            },
            component: CheckoutCompleteView
        }, 
        {   // 登入
            path: '/login',
            name: 'Login',
            meta: {
                title: '登入',
            },
            component: LoginView
        },
        {   // 註冊
            path: '/signUp',
            name: 'SignUp',
            meta: {
                title: '註冊',
            },
            component: SignUpView
        },
        {   // 登出
            path: '/signOut',
            name: 'SignOut',
            meta: {
                title: '登出',
            },
            component: SignOutView
        },
        {   // 管理帳號 --> 帳號、購買記錄
            path: '/manageAccount',
            name: 'ManageAccount',
            meta: {
                isMember: "account",
            },
            component: ManageAccountView,
            children: [
                {
                    path: 'account',
                    name: 'Account',
                    meta: {
                        title: '帳號管理',
                    },
                    component: AccountView
                },
                {
                    path: 'changePwd',
                    name: 'ChangePwd',
                    meta: {
                        title: '修改密碼',
                    },
                    component: ChangePwd
                },
                {
                    path: 'shopHistory',
                    name: 'ShopHistory',
                    meta: {
                        title: '購買紀錄',
                    },
                    component: ShopHistoryView
                }
            ]
        },
        {
            path: '/admin/admin',
            name: 'Admin',
            meta: {
                isMember: "account",
                isAdmin: "admin",
                title: '後台管理'
            },
            component: AdminView,
        },
        {
            path: '/admin/product/',
        },
        {
            path: '/:pathMatch(.*)*',
            name: 'NotFound',
            component: NotFoundView
        }
    ]
})
console.log(router);

// router.beforeEach(async (to, from, next) => {

//     // 表投更改
//     document.title = `${to.meta.title || '夢幻宇宙網'}`;

//     const accountStore = useAccountStore();

//     // 會員、非會員、管理員 標頭 => 0、1、2
//     accountStore.isAccountAdmin = 1;

//     if (to.name != "SignOut") {

//         let UUID = accountStore.tk;
//         const checkLogin = await axios.post(getAccountAPI('checkAccount'),
//             {
//                 "token": `Bearer ${UUID}`
//             }, setting).catch((err) => {
//                 console.log(err);
//             });
//         if (checkLogin) {
//             if (checkLogin.data.status == 200) {
//                 accountStore.account = checkLogin.data.data.account;
//                 // 判別是否管理員頁面
//                 if (checkLogin.data.data.permission == 0) {
//                     accountStore.isAccountAdmin = 0;
//                 }
//                 next();
//             } else {
//                 accountStore.account = '';
//                 /* 判別是否在會員頁面，若是則跳轉至首頁 */
//                 to.meta.isMember == "account" ? next("/login") : next();
//             }
//         } else {
//             accountStore.account = '';
//             /* 判別是否在會員頁面，若是則跳轉至首頁 */
//             to.meta.isMember == "account" ? next("/login") : next();
//         }
//     } else {
//         accountStore.account = '';

//         if (to.name == 'SignOut') {
//             accountStore.isAccountAdmin = 2;
//         }
//         next();
//     }
// })

export default router
