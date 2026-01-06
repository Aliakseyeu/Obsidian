
```sql
CONCAT_WS('', c3.default_sort, c2.default_sort, c1.default_sort)
```

Функция `CONCAT_WS('', c3.default_sort, c2.default_sort, c1.default_sort)` — это специальный способ **объединить (склеить) несколько строк в одну**, при этом:
`WS` означает **With Separator** — т.е. "со склеиванием через разделитель"
первый аргумент `''` — это **разделитель** (в данном случае — **пустая строка**)
остальные аргументы — это **значения, которые склеиваются**

Никогда не вернёт NULL (если хоть одно значение не NULL)

---

```
SELECT role, GROUP_CONCAT(username)
FROM users
GROUP BY role;
```

admin → "alice,bob"
user  → "john,mark"

**`GROUP_CONCAT`** — это агрегатная функция MySQL, которая **склеивает значения из нескольких строк в одну строку** внутри группы.

```sql
GROUP_CONCAT(name SEPARATOR ' | ')
```

```sql
GROUP_CONCAT(DISTINCT status)
```

```sql
GROUP_CONCAT(name ORDER BY name ASC)
```