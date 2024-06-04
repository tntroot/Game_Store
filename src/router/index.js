import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'

const SearchView  = () => import('../views/SearchView.vue');
const ShoppingCarView  = () => import('../views/ShoppingCarView.vue');
const SignUpView  = () => import('../views/SignUpView.vue');
const ItemView = () => import('../views/ItemView.vue');
const LoginView  = () => import('../views/LoginView.vue');

const router = createRouter({
  // history: createWebHistory(import.meta.env.BASE_URL),
  history: createWebHistory("/113-1-11"),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView
    },
    {
      path: '/search',
      name: 'Search',
      component: SearchView,
    },
    {
      path: '/search/item',
      name: 'SearchItem',
      component: ItemView
    },
    {
      path: '/account/shoppingCar',
      name: 'AccountShoppingCar',
      component: ShoppingCarView
    },
    {
      path: '/login',
      name: 'Login',
      component: LoginView
    },
    {
      path: '/signUp',
      name: 'SignUp',
      component: SignUpView
    }
  ]
})

export default router
