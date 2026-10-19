[[MySql]]

```sql
INSERT INTO counters (name, value)
VALUES ('clicks', 1)
ON DUPLICATE KEY UPDATE
value = value + VALUES(value);
```

## Что такое `VALUES(column)`

`VALUES(errors_proxy)`

👉 это **значение, которое ты пытался вставить** в `INSERT`.

⚠️ В MySQL 8.0.20+ синтаксис `VALUES()` **deprecated**, но **пока работает**.

Современный аналог:

```mysql
INSERT INTO users (id, name, login_count)
VALUES (1, 'John', 1) AS new_user
ON DUPLICATE KEY UPDATE
    name = new_user.name,
    login_count = login_count + new_user.login_count;
```

---

[[DUPLICATE KEY UPDATE]]