[[MySql]]
[[REGEXP_REPLACE]]

```
REPLACE(string, from_string, to_string)
```

- `string` — исходная строка (или колонка).
- `from_string` — что искать (буквально).
- `to_string` — на что заменить.

```mysql
SELECT REPLACE('www.example.com', 'www.', '');
-- 'example.com'

SELECT REPLACE('Hello World', 'World', 'PHP');
-- 'Hello PHP'

SELECT REPLACE('a-b-c-d', '-', '_');
-- 'a_b_c_d'  (заменяет ВСЕ вхождения)
```