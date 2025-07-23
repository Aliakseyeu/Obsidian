
```js
const screens = ['sm', 'md', 'lg', 'xl', 'left', 'max-sm', 'max-md', 'max-lg', 'max-xl', 'max-left']

safelist: [
        'bg-error-light',
        ...[...Array(10).keys()].flatMap(
            size => screens.flatMap(
                screen => [`${screen}:col-span-${size}`, `${screen}:grid-x-${size}`, `${screen}:flex-x-${size}`]
            ).concat([`col-span-${size}`, `grid-x-${size}`])
        ),
        ...screens.flatMap(i => [`${i}:flex`, `${i}:grid`, `${i}:hidden`]),
    ],
```