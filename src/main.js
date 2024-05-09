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
// register Swiper custom elements
register();

// import styles bundle
// import 'swiper/css/bundle';
// import Swiper from 'swiper'

import '../node_modules/swiper/swiper-element-bundle.min'
import '../node_modules/swiper/swiper-bundle.min.css'



const app = createApp(App)

app.use(createPinia())
app.use(router)

app.mount('#app')


