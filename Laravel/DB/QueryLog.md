#php 

[[Laravel]]
[[Laravel/DB/DB|DB]]

```php
DB::enableQueryLog();
$models = Model::all();
$queries = DB::getQueryLog();  
Log::debug($queries);
```