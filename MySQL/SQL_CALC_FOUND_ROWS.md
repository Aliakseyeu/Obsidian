
```sql
SELECT SQL_CALC_FOUND_ROWS *
FROM users
WHERE status = 'active'
LIMIT 10 OFFSET 20;

SELECT FOUND_ROWS();
```

Позволяет получить:

- строки с `LIMIT`
- **общее количество строк БЕЗ `LIMIT`**

Устаревшая и не рекомендуемая конструкция. Лучше использовать 2 запроса

```sql
SELECT *
FROM users
WHERE status = 'active'
LIMIT 10 OFFSET 20;

SELECT COUNT(*)
FROM users
WHERE status = 'active';
```