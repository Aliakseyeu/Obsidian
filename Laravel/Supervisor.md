#laravel #linux
```
sudo apt-get update
sudo apt-get install supervisor
sudo nano /etc/supervisor/conf.d/laravel-worker.conf
```

```[program:laravel-worker]
process_name=%(program_name)s_%(process_num)02d
command=php /var/www/www-root/data/www/alfastok_private/artisan queue:work --sleep=3 --tries=3 --timeout=90
autostart=true
autorestart=true
user=www-data
numprocs=1
redirect_stderr=true
stdout_logfile=/var/www/www-root/data/www/alfastok_private/storage/logs/worker.log

```

```
sudo supervisorctl reread
sudo supervisorctl update
sudo supervisorctl start laravel-worker
```