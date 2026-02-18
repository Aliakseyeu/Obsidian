
```php
array_filter(  
    $arr,  
    static function (string $value, int $key): bool {  
        return $key > 10;  
    },  
    ARRAY_FILTER_USE_BOTH  
);
```

- ARRAY_FILTER_USE_BOTH - передавать значение и ключ
- ARRAY_FILTER_USE_KEY - передавать ключ вместо значения