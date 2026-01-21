
```php
public function isActive(): self  
{  
    return $this->state([  
        'status' => StateEnum::Active->value  
    ]);  
}
```

```php
Model::factory()->isActive()->count(5)->create([  
    'field' => 'value'
]);
```