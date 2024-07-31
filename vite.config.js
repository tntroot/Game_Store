import { fileURLToPath, URL } from 'node:url'
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import vueJsx from '@vitejs/plugin-vue-jsx'

import VueRouter from 'unplugin-vue-router/vite'

import * as path from 'path';

// https://vitejs.dev/config/
export default defineConfig({
    publicPath: "./",
    plugins: [
        VueRouter({
            routesFolder: [
                {
                    src: 'src/views',
                    path: '',
                    // override globals
                    exclude: (excluded) => excluded,
                    filePatterns: (filePatterns) => filePatterns,
                    extensions: (extensions) => extensions,
                },
            ],
            extensions: ['.vue'],
            filePatterns: ['**/*'],
            exclude: ["**/node_modules/**", "**/components/**"],

            // where to generate the types
            dts: './typed-router.d.ts',
            // how to import routes. can also be a string
            importMode: 'async',

            // default language for <route> custom blocks
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
        vueJsx(),
    ],
    resolve: {
        alias: {
            //   '@': fileURLToPath(new URL('./src', import.meta.url))
            '@': path.resolve(__dirname, './src')
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
            }
        }
    },
    publicDir: 'assets',
    filenameHashing: false,

    base: "/"
})
