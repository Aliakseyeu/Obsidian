
```mysql
SUBSTRING_INDEX(column, '|', 1
```

Функция `SUBSTRING_INDEX()` в MySQL возвращает подстроку из строки до указанного количества вхождений разделителя. [[1](https://oracleplsql.ru/mysql-function-substring_index.html), [2](https://www.tutorialspoint.com/mysql/mysql_substring_index_function.htm), [3](https://www.scaler.com/topics/mysql-string-split/)]

---

Синтаксис
```mysql
SUBSTRING_INDEX(строка, разделитель, счетчик)
```

- **строка**: Исходный текст для обработки.
- **разделитель**: Символ или текст, по которому делится строка.
- **счетчик**: Количество вхождений разделителя.
    - **Положительный**: Поиск идет **слева направо**, возвращается всё **слева** от разделителя.
    - **Отрицательный**: Поиск идет **справа налево**, возвращается всё **справа** от разделителя.

---

Практические примеры

**1. Получение домена из email (счетчик `1`)**

- Запрос: `SELECT SUBSTRING_INDEX('user@example.com', '@', -1);`
- Результат: `'example.com'` [[1](https://www.sql-easy.com/learn/how-to-split-a-string-in-mysql/), [2](https://www.linkedin.com/pulse/how-mysql-learns-use-more-than-one-index-story-merge-union-sidhaiyan-giwxc)]

**2. Получение имени пользователя из email (счетчик `1`)**

- Запрос: `SELECT SUBSTRING_INDEX('user@example.com', '@', 1);`
- Результат: `'user'` [[1](https://www.sql-easy.com/learn/how-to-split-a-string-in-mysql/)]

**3. Извлечение части IP-адреса (счетчик `2`)**

- Запрос: `SELECT SUBSTRING_INDEX('192.168.1.100', '.', 2);`
- Результат: `'192.168'`

**4. Выборка центрального элемента (комбинация функций)**

- Задача: Извлечь второе слово из строки `'раз.два.три.четыре'`.
- Запрос: `SELECT SUBSTRING_INDEX(SUBSTRING_INDEX('раз.два.три.четыре', '.', 2), '.', -1);`
- Результат: `'два'` [[1](https://www.schoolsw3.com/sql/func_mysql_substring_index.php)]