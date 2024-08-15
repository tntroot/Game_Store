import { createRouter, createWebHistory } from 'vue-router'
import axios from 'axios';
import { gameAPI, getAccountAPI, setting } from '../assets/JS/function';
import { useAccountStore } from '../stores/account';

import { routes } from 'vue-router/auto-routes'

for (const route of routes) {
    if (route.name === 'HomeView') {
        route.path = '/';
    }
    if (route.path === '/account') {
        route.meta = {
            isMember: "account",
        };
        if (route.children && route.children.length) {
            route.children = route.children.map(child => {
                child.meta = {
                    ...route.meta,
                }
                return child;
            });
        }
    }
    if (route.path === '/admin') {
        route.meta = {
            isMember: "account",
            isAdmin: "admin",
        };
        if (route.children && route.children.length) {
            route.children = route.children.map(child => {
                child.meta = {
                    ...route.meta,
                }
                return child;
            });
        }
    }
  }

const router = createRouter({
    history: createWebHistory("/113-1-11"),
    routes:[
        ...routes,
        {
            // 404
            path: '/:pathMatch(.*)*',
            name: 'NotFound',
            component: () => import('../views/NotFound.vue')
        }
    ],
})

router.beforeEach(async (to, from, next) => {

    if(to.path == "/item" || to.path == "/admin/leaveReply/showMessage"){
        let res = await axios.post(gameAPI("getGameId"), { "game_id": to.query.gameId }, setting).catch((error) => console.log(error.response.data))
        if(!res) {return;} 
        const data = res.data.data;
        to.meta = {
            ...to.meta,
            title: data.name,
            itemData: data,  // 將資料傳進頁面
        }
    }

    // 表投更改
    document.title = `${to.meta.title || '夢幻宇宙網'}`;

    //next();

    const accountStore = useAccountStore();

    // 會員、非會員、管理員 標頭 => 0、1、2
    accountStore.isAccountAdmin = 1;

    if (to.path != "/account/signout") {

        let UUID = accountStore.tk;
        const checkLogin = await axios.post(getAccountAPI('checkAccount'),
            {
                "token": `Bearer ${UUID}`
            }, setting).catch((err) => {
                console.log(err);
            });
        if (checkLogin) {
            if (checkLogin.data.status == 200) {
                accountStore.account = checkLogin.data.data.account;
                // 判別是否管理員頁面
                if (checkLogin.data.data.permission == 0) {
                    accountStore.isAccountAdmin = 0;
                    next();
                }else{
                    to.meta.isAdmin == "admin" ? next("/") : next();
                }
            } else {
                accountStore.account = '';
                accountStore.tk = '';
                /* 判別是否在會員頁面，若是則跳轉至首頁 */
                to.meta.isMember == "account" ? next("/login") : next();
            }
        } else {
            accountStore.account = '';
            accountStore.tk = '';
            /* 判別是否在會員頁面，若是則跳轉至首頁 */
            to.meta.isMember == "account" ? next("/login") : next();
        }
    } else {
        accountStore.account = '';
        accountStore.tk = '';

        if (to.path == "/account/signout") {
            accountStore.isAccountAdmin = 2;
        }
        next();
    }
})

export default router
