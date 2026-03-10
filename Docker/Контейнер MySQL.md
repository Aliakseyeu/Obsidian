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

Если несколько контейнеров

```yml
db:  
    image: mysql  
    volumes:  
        - mysql_data:/var/lib/mysql/
          
db_another:  
    image: mysql  
    volumes:  
        - mysql_another_data:/var/lib/mysql/
          
volumes:  
    mysql_data:  
        driver: local
    mysql_another_data:  
        driver: local
```