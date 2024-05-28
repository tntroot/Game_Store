import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import SearchView from '../views/SearchView.vue'
import ItemView from '../views/ItemView.vue';
import ShoppingCarView from '../views/ShoppingCarView.vue';

const router = createRouter({
  // history: createWebHistory(import.meta.env.BASE_URL),
  history: createWebHistory(),
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
    }
  ]
})

export default router
