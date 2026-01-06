
```php
$cursor = Model::where('updated_at', '>', $lastRepairDate)->cursor();
```

Курсор получает все данные за один запрос, но хранить их в MySQL используя его курсор. И возвращает ссылку по типу PDO::fetch()