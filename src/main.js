import { createApp } from 'vue'
import { createPinia } from 'pinia'

import App from './App.vue'
import router from './router'

// bootstrap 樣式
import 'bootstrap'
import './assets/SASS/all.scss'

// 自訂樣式
import './assets/SASS/_setting.scss'

// swiper
// import '../node_modules/swiper/swiper-bundle'
// import '../node_modules/swiper/swiper-bundle.min'
// import '../node_modules/swiper/swiper.min'

// import '../node_modules/swiper/swiper-bundle.css'
// import '../node_modules/swiper/swiper-bundle.min.css'

import { Swiper, SwiperSlide } from 'swiper/vue'

// import function to register Swiper custom elements
import { register } from 'swiper/element/bundle';
// register Swiper custom elements
register();

import { Icon } from '@iconify/vue';

const app = createApp(App)

app.use(createPinia())
app.use(router)
app.component('swiper', Swiper).component('SwiperSlide', SwiperSlide).component('Icon', Icon)

app.mount('#app')




