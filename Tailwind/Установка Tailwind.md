### Установка
Один из нескольких вариантов
```bash
npm install -D tailwindcss postcss autoprefixer
npm install -D tailwindcss@latest
npm install -D tailwindcss@3
```

Один из нескольких вариантов
```bash
npx tailwindcss init -p
npm exec tailwindcss init -p
```

[https://tailwindcss.com/docs/installation/using-vite](https://tailwindcss.com/docs/installation/using-vite)
```bash
npm install tailwindcss @tailwindcss/vite
```

```js
// vite.config.js
import { defineConfig } from 'vite'
import tailwindcss from '@tailwindcss/vite'
export default defineConfig({ 
	plugins: [ 
		tailwindcss(), 
	],
})
```

```css
@import "tailwindcss";
```