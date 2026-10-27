#cache

[[Laravel]]
[[Cache]]

```php
 cache()->remember('key', now()->addDay(), fn() => true);
```