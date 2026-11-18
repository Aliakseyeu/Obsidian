#php #mysql 

[[Laravel]]
[[Laravel/DB/DB|DB]]

```php
$column = DB::select("SHOW COLUMNS FROM table WHERE Field = 'column'");  
$type = $column[0]->Type;
```