```sql
IF(
	column_for_check IS NOT NULL, 
	column_if_true, 
	column_if_false
) 
column_in_result
```

Для простой проверки на NULL можно использовать [[NULL]] или [[Coalesce]]