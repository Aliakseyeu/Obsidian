
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

`proxy + new.proxy`

---

[[DUPLICATE KEY UPDATE]]