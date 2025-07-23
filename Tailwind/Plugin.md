
```js
plugin(function ({ addUtilities, e }) {
	const paddings = { xs: 1, sm: 3, md: 4, lg: 8 };

	const pads = Object.keys(paddings).reduce((acc, padding) => {
		let size = '@apply p-' + paddings[padding];
		acc[`.p-${padding}-square`] = {
			[size]: {}
		};
		size = '@apply px-' + paddings[padding] + ' py-' + Math.floor(paddings[padding] / 2);
		acc[`.p-${padding}`] = {
			[size]: {}
		};
		size = '@apply px-' + paddings[padding];
		acc[`.px-${padding}`] = {
			[size]: {}
		};
		size = '@apply py-' + Math.floor(paddings[padding] / 2);
		acc[`.py-${padding}`] = {
			[size]: {}
		};
		return acc;
	}, {});

	addUtilities(pads, ['responsive']);
}),
```