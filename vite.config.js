import { fileURLToPath, URL } from 'node:url'
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import vueJsx from '@vitejs/plugin-vue-jsx'

import VueRouter from 'unplugin-vue-router/vite'
import AutoImport from 'unplugin-auto-import/vite'
import Components from 'unplugin-vue-components/vite'

import * as path from 'path';

// https://vitejs.dev/config/
export default defineConfig({
    publicPath: "/",
    plugins: [
        VueRouter({
            routesFolder: [
                {
                    src: 'src/views', // 配置路由來源文件
                    path: '', // 路由前綴
                },
            ],
            extensions: ['.vue'], 
            filePatterns: ['**/*'],
            exclude: ["**/node_modules/**", "**/components/**"], // 排除

            // 使用異部載入
            importMode: 'async',

            // json5 格式
            routeBlockLang: 'json5',
            extendRoute(route) {
                // 去掉 name 属性中的 `/` 前缀
                if (route.name.startsWith('/')) {
                    route.name = route.name.slice(1);
                }
                return route;
            },
        }),
        vue({
            template: {
                compilerOptions: {
                    isCustomElement: tag => tag.startsWith('swiper-'),
                }
            }
        }),
        AutoImport({
            imports: ['vue', 'vue-router', 'pinia'],
            dirs: [
                '@/store',       // 自动导入 store 目录中的所有文件
                '@/assets/JS',   // 自动导入 assets/JS 目录中的所有文件
            ]
        }),
        Components({
            dirs: [
                '@/components',  // 自动导入 components 目录中的所有文件
            ],
        }),
        vueJsx(),
    ],
    resolve: {
        alias: {
            //   '@': fileURLToPath(new URL('./src', import.meta.url))
            '@': path.resolve(__dirname, './src'),
        },
    },

    root: './',
    build: {
        // outDir: 'dist',
        rollupOptions: {
            output: {
                assetFileNames: (assetInfo) => {
                    let extType = assetInfo.name.split('.').at(1);
                    let extTypeName = assetInfo.name.split('_');

                    // 查詢是否為圖片副檔名
                    if (/png|jpe?g|svg|gif|webp|tiff|bmp|ico/i.test(extType)) {
                        extType = 'img';

                        if (extTypeName.at(1)) {
                            return `assets/${extType}/${extTypeName.at(0)}/[name]-[hash][extname]`;
                        }
                    }
                    return `assets/${extType}/[name]-[hash][extname]`;
                },
                chunkFileNames: 'assets/js/[name]-[hash].js',
                entryFileNames: 'assets/js/[name]-[hash].js'
            },
        }
    },
    publicDir: 'assets',
    filenameHashing: false,

    base: "./"
})
