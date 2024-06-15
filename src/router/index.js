import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'

const SearchView = () => import('../views/SearchView.vue');
const SignUpView = () => import('../views/SignUpView.vue');
const ItemView = () => import('../views/ItemView.vue');
const LoginView = () => import('../views/LoginView.vue');
const ShoppingCarView = () => import('../views/Account/ShoppingCarView.vue');
const CheckoutView = () => import('../views/Account/CheckoutView.vue');
const CheckoutCompleteView = () => import('../views/Account/CheckoutCompleteView.vue');

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
      path: '/account',
      name: 'Account',
      children: [
        {
          path: 'shoppingCar',
          component: ShoppingCarView
        },
        {
          path: 'checkout',
          component: CheckoutView
        },
        {
          path: 'checkoutComplete',
          component: CheckoutCompleteView
        }
      ]
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
