
```bash
rsync -avz Загрузки/my_file.json my_username@ip_address:/var/www/storage/app/imports
```

Если нужно указать порт

```php
rsync -avz -e "ssh -p 2222" file user@server:/path/
```