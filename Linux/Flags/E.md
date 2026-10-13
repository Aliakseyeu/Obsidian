
```bash
grep -E 'some_text' access.log
```

### `-E` (или `--extended-regexp`) — расширенные регулярные выражения

Флаг `-E` переключает `grep` в режим **расширенных регулярных выражений** (POSIX ERE — Extended Regular Expressions). Без него grep работает в режиме **базовых** (BRE — Basic Regular Expressions).

### Примеры

**Альтернация (`|`):**

# BRE — нужно экранировать
```
grep 'error\|warning' file.log
```
# ERE — без экранирования
```
grep -E 'error|warning' file.log
```

**Группировка (`()`) и квантификатор (`+`):**

# BRE — всё экранировано, читать невозможно
```
grep '\(error\|warning\)\+' file.log
```
# ERE — чисто и понятно
```
grep -E '(error|warning)+' file.log
```

**Квантификатор `{n,m}`:**
# BRE
```
grep '[0-9]\{3,5\}' file.log
```
# ERE
```
grep -E '[0-9]{3,5}' file.log
```

---

### 🎯 Практические примеры для access.log

**Найти GET или POST:**
# BRE
```
grep '"GET\|"POST' access.log
```
# ERE
```
grep -E '"(GET|POST)' access.log
```

**Найти коды 4xx или 5xx:**

# BRE
```
grep ' [45][0-9][0-9] ' access.log
```
# ERE (то же самое, но можно комбинировать)
```
grep -E ' (4|5)[0-9]{2} ' access.log
```

**Найти повторяющиеся символы:**

# ERE — 3 и более одинаковых цифры подряд
```
grep -E '([0-9])\1{2,}' access.log
```

**Найти строки с IPv4:**

```
grep -E '([0-9]{1,3}\.){3}[0-9]{1,3}' access.log
```