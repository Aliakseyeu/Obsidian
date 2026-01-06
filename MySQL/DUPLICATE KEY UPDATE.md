
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
  '%s', '%s', 1, %d, %d,NOW()
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

Если в таблице уже есть строка: refs = 5 и proxy = 2`

и ты вставляешь: refs = 1 и proxy = 3

Тогда после запроса будет: refs = 6 и proxy = 5

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