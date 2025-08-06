```php
$consentToken = Str::ulid();
Cookie::queue(
	name: 'cookie_consent_token',
	value: $consentToken,
	minutes: 525600, // 1 год в минутах
	path: '/',
	domain: null, // текущий домен
	secure: true, // HTTPS-only
	httpOnly: true, // защита от XSS
	sameSite: 'lax' // защита от CSRF
);
```