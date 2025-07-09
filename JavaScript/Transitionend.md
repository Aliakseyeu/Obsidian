Событие срабатывает в момент завершения анимации перехода. Затем удаляется, чтобы не было повторного срабатывания
```js
const fadeOut = new Promise(resolve => {
        items.style.transition = 'opacity 0.5s';
        items.style.opacity = 0;
        items.addEventListener('transitionend', function handler() {
            items.removeEventListener('transitionend', handler);
            resolve();
        });
    });
```

Далее можно пробросить в [[Promises]]
