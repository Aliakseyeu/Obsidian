
```php
class Cabinet extends ActiveRecord  
{  
    public function getAccounts(): ActiveQuery  
    {  
        return $this->hasMany(Account::class, ['id' => 'account_id'])  
            ->viaTable(
	            'account__cabinet', 
	            ['cabinet_id' => 'id'],
	            static function (ActiveQuery $query): void {  
				    $query->where(['account_cabinet.status' => true]);  
				});  
    }  
}
```

- удаленная модель
- столбец связанной модели в удаленной таблице
- столбец связанной модели в промежуточной таблице
- промежуточная таблица
- столбец текущей модели в промежуточной таблице
- столбец в текущей таблице

---

Так же условие для связи можно задать с помощью метода onCondition, но не для промежуточной таблицы

```php
return $this->hasMany(Account::class, ['id' => 'account_id'])
	->viaTable('account__cabinet', ['cabinet_id' => 'id'])
	->onCondition(['is_active' => 1])
	->andOnCondition(['>', 'created_at', '2024-01-01']);
```