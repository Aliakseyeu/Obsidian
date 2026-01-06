
```sql
ORDER BY IF(column = 'value', 1, 2)
```

Все строки с **column == 'value'** будут идти первыми, остальные будут идти вторыми.
Можно заменить на:

```sql
ORDER BY (column = 'value') DESC
```

```sql
ORDER BY CASE
  WHEN column = 'value' THEN 1
  ELSE 2
END
```

Дополнительная сортировка для **column != 'value'**

```sql
ORDER BY
  IF(column = 'value', 1, 2),
  column ASC
```

---

