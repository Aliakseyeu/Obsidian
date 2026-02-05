
Для того чтобы иметь гарантию что в коллекции будет как минимум 1 элемент из требуемых

```php
MyModel::factory()  
    ->count(100)  
    ->sequence(  
        ['field' => MyEnum::First],  
        ['field' => MyEnum::Second],  
        ['field' => MyEnum::Third]  
    )  
    ->create([  
        'some' => $some,  
    ]);
```

```php
$arr = [1, 2, 3];

MyModel::factory()
    ->count(count($arr))
    ->sequence(fn ($sequence) => [
        'dig' => $arr[$sequence->index],
    ])
    ->create();
```