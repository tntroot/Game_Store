import { createApp } from 'vue'
import { createPinia } from 'pinia'

import App from './App.vue'
import router from './router'

// 自訂樣式
import './assets/SASS/_setting.scss'

// bootstrap 樣式
import 'bootstrap'
import './assets/SASS/_all.scss'

const app = createApp(App)

app.use(createPinia())
app.use(router)

app.mount('#app')
