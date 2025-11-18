docker-compose.yml

```yml
db:  
    image: mysql  
    volumes:  
        - mysql_data:/var/lib/mysql/
```

В самом конце файла
```yml
volumes:  
    mysql_data:  
        driver: local
```