
```php
$cursor = (new Repair)->setConnection('mysql2');
$cursor = $cursor->newQuery()->from('profile_repairs')->where('updated_at', '>', $lastRepairDate)->cursor();
```

[[Cursor]]