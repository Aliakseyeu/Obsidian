
```php
protected static function booted(): void
{
	static::addGlobalScope(new NotHiddenScope);
}
```

### Получение без scope
```php
$model = Model::withoutGlobalScope(NotHiddenScope::class)
	->where('uuid', $request->xml['uuid'])
	->first();
```

[[NotHidden]]

