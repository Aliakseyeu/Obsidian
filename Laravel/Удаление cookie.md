```php
protected array $allowedCookies = [
	'laravel_session',
	'XSRF-TOKEN',
];

public function handle($request, Closure $next)
{
	$response = $next($request);

	$consent = cookieConsentManager()->consent();

	if (cookieConsentManager()->accepted($consent)) {
		return $response;
	}

	// 1. Фильтрация Set-Cookie заголовков
	$filtered = array_filter(
		$response->headers->getCookies(),
		fn(Cookie $cookie) => in_array($cookie->getName(), $this->allowedCookies)
	);

	// 2. Удаление всех исходных Set-Cookie
	$response->headers->remove('Set-Cookie');

	// 3. Установка только разрешённых Set-Cookie
	foreach ($filtered as $cookie) {
		$response->headers->setCookie($cookie);
	}

	// 4. Удаление запрещённых cookies, уже пришедших от клиента
	foreach ($request->cookies->keys() as $cookieName) {
		if (in_array($cookieName, $this->allowedCookies)) {
			continue;
		}

		$parts = explode('.', config('app.url'));
		$mainDomain = implode('.', array_slice($parts, -2));
		$mainDomain = str_replace('/', '', $mainDomain);

		$response->headers->setCookie(
			Cookie::create($cookieName)
				->withExpires(time() - 3600)
				->withPath('/')
				->withDomain($mainDomain)
		);
	}

	return $response;
}
```