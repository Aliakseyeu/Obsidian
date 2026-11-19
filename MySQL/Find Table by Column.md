[[MySql]]

```sql
SELECT TABLE_SCHEMA,  
       TABLE_NAME,  
       COLUMN_NAME,  
       DATA_TYPE  
FROM information_schema.columns  
WHERE COLUMN_NAME LIKE '%pattern%'  
  AND TABLE_SCHEMA = 'my_databse_name'  
ORDER BY TABLE_NAME, COLUMN_NAME;
```