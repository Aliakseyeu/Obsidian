В реквесте
```php
protected function prepareForValidation(): void  
{  
    $this->merge($this->route()->parameters());  
}
```