
```php
public function relation(): HasMany  
{  
    $newHasMany = $this->newHasMany(
	    RelatedModel::query(), 
	    $this, 
	    'partner_id', 
	    'partner_id'
	);  
  
    return $newHasMany  
        ->join(  
            'table',  
            'table.field',  
            '=',  
            'table2.field'  
        )  
        ->whereNull('table.field2');  
}
```