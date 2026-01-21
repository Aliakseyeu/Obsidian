#laravel #eloquent #scopes

```php
class MaxCaseScope
{
    public function __invoke(
	    Builder $query, 
	    string $alias, 
	    string $caseKey, 
	    string $caseValue, 
	    string $valueKey, 
	    ?string $column
    ): Builder
    {
        $column ??= $caseValue;

        $case = sprintf(
	        "MAX(CASE WHEN %s.%s = '%s' THEN %s.%s END) AS `%s`", 
	        $alias, $caseKey, $caseValue, $alias, $valueKey, $column
        );

        return $query->addSelect(DB::raw($case));
    }
}
```

```php
public function scopeWithAttributes(Builder $query, ...$attributes): Builder
{
	$attribues = count($attributes) > 0
		? Attributes::only(...$attributes)
		: Attributes::cases();

	foreach ($attribues as $attribute) {
		$query->withAttribute($attribute);
	}

	$query->leftJoin('attribute_item', 'items.uuid', '=', 'attribute_item.item_uuid');
	
	return $query;
}

public function scopeWithAttribute(Builder $query, Attributes $attribute): Builder
{
	return app(MaxCaseScope::class)->__invoke(
		$query,
		$attribute->pivotTable(),
		$attribute->foreignPivotField(),
		$attribute->value,
		$attribute->pivotField(),
		$attribute->name
	);
}
```

[[Транспонирование таблицы]]
[[Фильтрация по ключу]]