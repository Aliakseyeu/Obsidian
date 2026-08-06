
```php
->leftJoin(DB::raw("my_table FORCE INDEX (my_table_index)"), static function (JoinClause $join) {
```