[[Laravel]]
[[Laravel/DB/DB|DB]]
[[Migrations]]

```bash
php artisan migrate:rollback --batch=3 --pretend
```

Выведет список миграций батча номер 3, которые будут отменены