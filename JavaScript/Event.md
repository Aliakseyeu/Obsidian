#javascript #event

События
### Событие
```js
export default class ItemsSortedEvent extends CustomEvent {
    static name = 'items-sorted'
    constructor(sort) {
        super(ItemsSortedEvent.name, { detail: { sort: sort } })
    }
}
```

### Слушатель
```js
window.addEventListener(ItemsSortedEvent.name, request);
```

### Поджигание
```js
window.dispatchEvent(new ItemsSortedEvent(sort))
```