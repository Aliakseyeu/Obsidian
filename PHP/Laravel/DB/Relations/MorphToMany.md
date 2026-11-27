
```php
public function anotherModel(): MorphToMany  
{  
    return $this->morphedByMany(
	    AnotherModel::class, 
	    'related', 
	    'my_table_relations'
	);  
}
```

```php
Schema::create('my_table_relations', function (Blueprint $table) {  
    $table->id();  
    $table->foreignIdFor(MyModel::class)->constrained();  
    $table->morphs('related');  
    $table->timestamps();  
    
    $table->index(['related_id', 'related_type']);
});
```