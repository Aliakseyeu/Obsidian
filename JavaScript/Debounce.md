#javascript 

Задержка перед событием
```js
export default function debounce(func, delay = 300) {
    let timeoutId
    return (...args) => {
        clearTimeout(timeoutId)
        timeoutId = setTimeout(() => {
            func.apply(this, args)
        }, delay)
    }
}
```

```js
const debounce = createDebounce(request)

input.addEventListener('input', e => {
    debounce()
})

const request = () => {}
```