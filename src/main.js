import { createApp } from 'vue'
import { createPinia } from 'pinia'

import App from './App.vue'
import router from './router'

// 自訂樣式
import './assets/SASS/_setting.scss'

// bootstrap 樣式
import 'bootstrap'
import './assets/SASS/_all.scss'

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



const app = createApp(App)

app.use(createPinia())
app.use(router)
app.component('swiper', Swiper).component('SwiperSlide', SwiperSlide)

app.mount('#app')

console.log(document.querySelector('.swiper-button-next'));




