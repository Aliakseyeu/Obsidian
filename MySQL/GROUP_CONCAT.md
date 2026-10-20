[[MySql]]
[[JSON_ARRAYAGG]]

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
Если мы хотим избежать дублирования строк, то нам не нужно включать в выборку столбцы из соединенной таблицы

---

Для удаления дублей можно использовать [[DISTINCT]]

```mysql
GROUP_CONCAT(DISTINCT r.name SEPARATOR ', ')
```

---

Если у пользователя может не быть ролей, то можно использовать [[COALESCE]]

```mysql
GROUP_CONCAT(COALESCE(r.name, '[Нет ролей]') SEPARATOR ', ')
```

---

Можно использовать сортировку [[ORDER BY]]

```mysql
GROUP_CONCAT(r.name ORDER BY r.name ASC SEPARATOR ', ')
```

---

Можно использовать дополнительную склейку [[CONCAT]]

```mysql
SELECT 
    GROUP_CONCAT(
        CONCAT(title, ' от ', date) -- 1. Склеиваем поля одной строки
        ORDER BY date ASC           -- 2. Сортируем строки перед склейкой
        SEPARATOR '\n'              -- 3. Указываем разделитель между строками
    ) as documents_list
FROM documents;
```

Результат выполнения:

```
Договор от 2026-01-15
Спецификация от 2026-03-20
Доп. соглашение №1 от 2026-05-10
```