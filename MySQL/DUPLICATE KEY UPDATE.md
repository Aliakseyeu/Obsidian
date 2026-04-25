
```sql
INSERT LOW_PRIORITY IGNORE INTO table
(
  ip,
  type,
  refs,
  proxy,
  errors,
  ondate
)
VALUES
(
  '192.168.1.100', 'ipv4', 1, 1, 0, NOW()
)
ON DUPLICATE KEY UPDATE
  refs = refs   + 1,
  proxy = proxy + VALUES(proxy)
```

---
### Проверка уникального ключа

Если **НЕ найден конфликт уникального индекса** (например по `(ip, type, ondate)`), то строка **вставляется как новая**

---

### Если конфликт есть (duplicate key)

Если запись **уже существует**, `INSERT` **не происходит**,  вместо этого выполняется блок:  `ON DUPLICATE KEY UPDATE`

---

## Что делает `ON DUPLICATE KEY UPDATE`

Это **атомарное обновление счётчиков**.

### Пример:

Если в таблице уже есть строка: refs = 1 и proxy = 1

и ты вставляешь: refs = 1 и proxy = 1

Тогда после запроса будет: refs = 2 и proxy = 2

Потому что: 

```
refs = refs + 1 
proxy = proxy + VALUES(proxy)
```

---

[[VALUES]]

---

[[IGNORE]]

---

[[LOW_PRIORITY]]