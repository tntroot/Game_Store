import { fileURLToPath, URL } from 'node:url'
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import autoprefixer from 'autoprefixer'
import vueJsx from '@vitejs/plugin-vue-jsx'

// https://vitejs.dev/config/
export default defineConfig({
  publicPath: "./",
  plugins: [
    vue({
      template: {
        compilerOptions: {
          isCustomElement: tag => tag.startsWith('swiper-'),
        }
      }
    }),
    vueJsx(),
  ],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url))
    }
  },

  root: './',
  build: {
    // outDir: 'dist',
    rollupOptions: {
      output: {
        assetFileNames: (assetInfo) => {
            let extType = assetInfo.name.split('.').at(1);
            let extTypeName = assetInfo.name.split('_').at(0);

            // 查詢是否為圖片副檔名
            if (/png|jpe?g|svg|gif|webp|tiff|bmp|ico/i.test(extType)) {
                extType = 'img';
            }
            if(extTypeName){
                return `assets/${extType}/${extTypeName}/[name]-[hash][extname]`;
            }
            return `assets/${extType}/[name]-[hash][extname]`;
        },
        chunkFileNames: 'assets/js/[name]-[hash].js',
        entryFileNames: 'assets/js/[name]-[hash].js'
      }
    }
  },
  publicDir: 'assets',
  filenameHashing: false,

  base: "./"
})
