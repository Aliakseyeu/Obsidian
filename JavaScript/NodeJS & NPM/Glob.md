```js
import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';
import glob from "glob";

export default defineConfig({
    plugins: [
        laravel({
            publicDirectory: '../alfastok.by/build',
            input: [...glob.sync('resources/scss/*.scss'), ...glob.sync('resources/js/*.js')],
            refresh: true,
        }),
    ],
    build: {
        outDir: '../alfastok.by/build',
        minify: false
    }
});
```

Если возникает ошибка 
> [!error] 
> failed to load config from /var/www/www-root/data/www/test.skiper.by/vite.config.mjs
error during build: 
>file:///var/www/www-root/data/www/test.skiper.by/vite.config.mjs.timestamp-1750079875556-e4daaf2b2de6c.mjs:4
import glob from "file:///var/www/www-root/data/www/test.skiper.by/node_modules/glob/dist/esm/index.js";

Проблема в твоём коде возникает из-за того, что `glob@11` экспортируется **только как ESM-модуль**, и ты пытаешься его импортировать через `require`-совместимый синтаксис (или Node неправильно резолвит модуль).
Поскольку ты используешь `vite.config.mjs`, который **уже является ESM-файлом**, тебе нужно правильно импортировать `glob`:


