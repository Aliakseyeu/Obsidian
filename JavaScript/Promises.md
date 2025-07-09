### Промис отслеживающий результаты нескольких промисов

```js
Promise.all([fadeOut, loadData]).then(([_, response]) => {
	items.innerHTML = response.data;
	items.style.opacity = 1;
});
```
"[_, response]" - деконструкция результатов каждого промиса