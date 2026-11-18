[[Docker]]

 nginx.conf

```bash
server {  
    listen 80;  
    server_name localhost;
  
    client_max_body_size 20M;  
  
    location / {  
    }  

}
```

добавить client_max_body_size - M (мегабайты), K (килобайты)

Перезапустить контейнер

[[Restart container]] или пересборка

[[Get current container settings]]

---

```dockerfile
RUN echo "memory_limit = 512M" > /usr/local/etc/php/conf.d/memory-limit.ini
```