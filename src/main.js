import { createApp } from 'vue'
import { createPinia } from 'pinia'
import piniaLoc from 'pinia-plugin-persistedstate'

import App from './App.vue'
import router from './router'

import "@/assets/bootstrap/bootstrap.min.css";
const borstrapJS = () => import("@/assets/bootstrap/bootstrap.bundle.min.js");
const jquery = () => import("@/assets/JS/jquery-3.7.1.js");

import './assets/SASS/all.scss'

// 自訂樣式
import './assets/SASS/_setting.scss'

// swiper 輪播套件
import { Swiper, SwiperSlide } from 'swiper/vue'
import { register } from 'swiper/element/bundle';
register();

// icon 套件
import { Icon } from '@iconify/vue';
// import ModalDiv from './components/ModalDiv.vue';
const ModalDiv = () => import('./components/ModalDiv.vue');

// wangEditor 富文本編輯器
// import '@wangeditor/editor/dist/css/style.css' // 引入 css
// import { Editor, Toolbar } from '@wangeditor/editor-for-vue';
// const { Editor, Toolbar } = () => import('@wangeditor/editor-for-vue');

router.afterEach((to, from, next) => {
    window.scrollTo(0, 0);
});

const app = createApp(App);
const pinia = createPinia();
pinia.use(piniaLoc);

app.use(pinia)
app.use(router)
app.use(borstrapJS).use(jquery)
app.component('swiper', Swiper).component('SwiperSlide', SwiperSlide).component('Icon', Icon).component('ModalDiv', ModalDiv)

app.mount('#app')




