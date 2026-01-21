
```php
public function scopeNotCheap(Builder $builder): Builder
{
	return $builder
		->whereDoesntHave(
			'attributes', 
			fn(Builder $q): Builder => $q
			->where('attributes.slug', 'quality')
			->where('attribute_item.value', Quality::Cheap->value)
		);
}
```


> [!info] 
> В условии сравнения со значением важно указывать равенство, а не неравенство. Потому что whereDoesntHave инвертирует результат
