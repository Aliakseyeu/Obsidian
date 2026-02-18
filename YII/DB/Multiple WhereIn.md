
```php
$conditions = [];  
  
foreach ($items as $item) { 
    $conditions[] = [  
        'AND',  
        ['item_id' => $item->id],  
        ['price' => $item->price],  
        ['name' => $item->name],
    ];  
}  
  
return $model->find()  
    ->where([  
        'OR',  
        ...$conditions  
    ])  
    ->asArray()  
    ->all();
```

[[MySQL/Multiple WhereIn|Multiple WhereIn]]