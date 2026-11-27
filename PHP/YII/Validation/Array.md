
```php
protected function rules(): array  
{  
    return [  
        'campaign_numbers' => ['required', 'array', 'max:10'],  
        'campaign_numbers.*' => ['required', 'int', 'min:1'],  
    ];  
}
```