
```php
json_encode($data, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
```

- JSON_UNESCAPED_UNICODE - не экранировать многобайтовые символы (включая русские буквы)
- JSON_PRETTY_PRINT - форматирование
- JSON_UNESCAPED_SLASHES - не экранировать слеши
- JSON_FORCE_OBJECT - принудительно делать объект