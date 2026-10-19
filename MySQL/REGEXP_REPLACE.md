[[MySql]]
[[REGEXP]]

```
REGEXP_REPLACE(subject, pattern, replacement
               [, position [, occurrence [, match_parameter ]]] )
```

- `subject` — исходная строка.
- `pattern` — регулярное выражение (ICU, с полной поддержкой Unicode).
- `replacement` — на что заменить.
- `position` — с какой позиции начать поиск (по умолчанию `1`).
- `occurrence` — какое по счёту совпадение заменить (по умолчанию `1`; `0` — все).
- `match_parameter` — флаги: `c` (регистрозависимо), `i` (регистронезависимо), `m` (многострочный режим), `n` (точка соответствует переводу строки), `u` (только Unix-переводы строк).

```mysql
-- Убрать всё, кроме цифр и плюса (очистка телефона)
SELECT REGEXP_REPLACE('+7 (999) 123-45-67', '[^0-9+]', '');
-- '+79991234567'

-- Заменить все последовательности пробелов на один пробел
SELECT REGEXP_REPLACE('Hello    World', ' +', ' ');
-- 'Hello World'

-- Заменить только 3-е совпадение
SELECT REGEXP_REPLACE('abc def ghi', '[a-z]+', 'X', 1, 3);
-- 'abc def X'
```

Если хотя бы один аргумент `NULL` — результат тоже `NULL`.