import { fileURLToPath, URL } from 'node:url'

import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import autoprefixer from 'autoprefixer'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    vue({
        template: {
          compilerOptions: {
            isCustomElement: tag => tag.startsWith('swiper-'),
          }
        }
      }),
  ],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url))
    }
  },

  root: './',
    build: {
        outDir: 'dist',
    },
    publicDir: 'assets',
    filenameHashing: false,
})
