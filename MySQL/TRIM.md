[[[MySql]]]

```sql
TRIM(LEADING 'www.' FROM column)
```

- `LEADING` — удалять только **слева** (в начале).
- `'www.'` — что именно удалять (литеральная подстрока, не regex).
- `FROM column` — из какого значения.

```mysql
TRIM(LEADING 'www.' FROM 'www.site.by')      -- 'site.by'
TRIM(LEADING 'www.' FROM 'site.by')          -- 'site.by' (без изменений)
TRIM(LEADING 'www.' FROM 'www.www.site.by')  -- 'site.by' (удалит все ведущие 'www.')
```