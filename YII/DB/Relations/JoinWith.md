
```php
Model::find()  
	->select(['filed'])  
	->innerJoinWith('relationName')  
	->where(['field' => $someValue])  
	->all();  
}
```

вернет записи у которых есть связующие записи в отношении relationName