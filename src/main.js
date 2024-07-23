import { createApp } from 'vue'
import { createPinia } from 'pinia'

import App from './App.vue'
import router from './router'

import './assets/SASS/all.scss'

// 自訂樣式
import './assets/SASS/_setting.scss'

// swiper 輪播套件
import { Swiper, SwiperSlide } from 'swiper/vue'
import { register } from 'swiper/element/bundle';
register();

// icon 套件
import { Icon } from '@iconify/vue';
import ModalDiv from './components/ModalDiv.vue';

// wangEditor 富文本編輯器
import '@wangeditor/editor/dist/css/style.css' // 引入 css
import { Editor, Toolbar } from '@wangeditor/editor-for-vue';

router.afterEach((to, from, next) => {
    window.scrollTo(0, 0);
});

const app = createApp(App)

app.use(createPinia())
app.use(router)
app.component('swiper', Swiper).component('SwiperSlide', SwiperSlide).component('Icon', Icon).component('ModalDiv', ModalDiv)
app.component('Editor', Editor).component('Toolbar', Toolbar)

app.mount('#app')




