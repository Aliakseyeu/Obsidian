
```php
$path = storage_path('app/imports/file.json');  
  
$json = json_decode(file_get_contents($path), true);
```