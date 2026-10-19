[[MySql]]

```mysql
SELECT
    u.id,
    u.name,
    GROUP_CONCAT(r.name SEPARATOR ', ') AS roles
FROM users u
LEFT JOIN user_roles ur ON ur.user_id = u.id
LEFT JOIN roles r ON r.id = ur.role_id
GROUP BY u.id, u.name;
```

Запрос вернет список пользователей со всеми ролями через запятую

---

Для удаления дублей можно использовать [[DISTINCT]]

```mysql
GROUP_CONCAT(DISTINCT r.name SEPARATOR ', ')
```

---

Если у пользователя может не быть ролей, то можно использовать [[Coalesce]]

```mysql
GROUP_CONCAT(COALESCE(r.name, '[Нет ролей]') SEPARATOR ', ')
```