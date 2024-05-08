import { createApp } from 'vue'
import { createPinia } from 'pinia'

import App from './App.vue'
import router from './router'

// 自訂樣式
import './assets/SASS/_setting.scss'

// bootstrap 樣式
import 'bootstrap'
import './assets/SASS/_all.scss'

// import function to register Swiper custom elements
import { register } from 'swiper/element/bundle';

import Swiper from 'swiper';
import { Navigation, Pagination } from 'swiper/modules';
// import Swiper and modules styles
import 'swiper/css';
import 'swiper/css/navigation';
import 'swiper/css/pagination';

// init Swiper:
const swiper = new Swiper('swiper-container', {
    // configure Swiper to use modules
    modules: [Navigation, Pagination],
});

const app = createApp(App)

app.use(createPinia())
app.use(router)

app.use(swiper)

register();

app.mount('#app')
