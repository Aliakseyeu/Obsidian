[[Laravel]]
[[Laravel/DB/DB|DB]]

```php
use Illuminate\Support\Facades\DB;

$result = DB::statement(
	'ALTER TABLE my_table ALTER COLUMN my_column DROP DEFAULT'
);

// $result === true
```

- **Выполняет** любой SQL: `ALTER`, `CREATE`, `DROP`, `TRUNCATE`, `INSERT` без возврата данных, `UPDATE`, `DELETE` и т.д.
- **Не возвращает** строки — только `true`/`false`.
- **Не использует** query builder — это «сырой» запрос.
- **Логирует** запрос в query log (если он включён), как и любой другой.