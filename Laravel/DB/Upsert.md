#laravel #upsert #eloquent  #db

> [!NOTE] Как работает
> Использует метод INSERT ... ON DUPLICATE KEY UPDATE
> Пытается добавить запись, но, если такой(ие) первичный ключ существует то обновляет поля update

```php
Model::upsert([
	['departure' => 'Oakland', 'destination' => 'San Diego', 'price' => 99],
	['departure' => 'Chicago', 'destination' => 'New York', 'price' => 150]
], 
uniqueBy: ['departure', 'destination'], 
update: ['price']);
```

[https://dev.mysql.coml](https://dev.mysql.com/doc/refman/8.4/en/insert-on-duplicate.html)
[https://itproger.com](https://itproger.com/spravka/sql/on-duplicate)
[https://habr.com](https://habr.com/ru/articles/156489/)