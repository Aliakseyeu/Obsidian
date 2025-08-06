```js
const parser = new DOMParser()
const labels = parser.parseFromString(string,'text/html').querySelectorAll('div')
```