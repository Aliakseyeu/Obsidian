
```sql
IFNULL(
	column_first, 
	column_if_first_is_null
) 
column_in_result
```

Для сравнения большего количества значений можно использовать [[Coalesce]]

Для сравнения по условию можно использовать [[IF]]

---

```mysql
IFNULL(coll + 0, 0) `coll`
```

Это выражение используется для безопасного преобразования значения в число с обработкой NULL.

coll = '123'   → '123' + 0 = 123   → IFNULL(123, 0) = 123
coll = 'abc'   → 'abc' + 0 = NULL  → IFNULL(NULL, 0) = 0
coll = NULL    → NULL + 0 = NULL   → IFNULL(NULL, 0) = 0
coll = ''      → '' + 0 = NULL     → IFNULL(NULL, 0) = 0
coll = '12.5'  → '12.5' + 0 = 12.5 → IFNULL(12.5, 0) = 12.5

