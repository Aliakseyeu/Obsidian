#laravel #linux #supervisor

```
sudo apt-get update
sudo apt-get install supervisor
sudo nano /etc/supervisor/conf.d/alfastok_private_queue.conf
```

```
[program:alfastok_private_queue]
process_name=%(program_name)s_%(process_num)02d
command=php /var/www/www-root/data/www/alfastok_private/artisan queue:work --sleep=3 --tries=3 --timeout=90
autostart=true
autorestart=true
stopasgroup=true
killasgroup=true
user=www-root
numprocs=1
redirect_stderr=true
#stdout_logfile=/var/www/www-root/data/www/alfastok_private/storage/logs/supervisor.log
stopwaitsecs=3600
```

```
sudo supervisorctl reread
sudo supervisorctl update
sudo supervisorctl start alfastok_private_queue
```