
```php
Yii::$app->db->createCommand()  
    ->batchInsert(  
        'table',  
        ['column', 'created_at', 'updated_at'],  
        [
	        ['field', '2026-02-06 10:10:10', '2026-02-06 10:10:10'],
	        ['field', '2026-02-06 10:10:10', '2026-02-06 10:10:10'],
	        ['field', '2026-02-06 10:10:10', '2026-02-06 10:10:10'],
        ]
    )  
    ->execute();
```