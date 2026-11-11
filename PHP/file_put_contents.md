[[PHP]]
[[File]]

```php
file_put_contents(  
    APPLICATION_DIRECTORY . 'tmp/sync.log',  
    \Carbon\CarbonImmutable::now()->toDateTimeString('microsecond') . json_encode(  
        $request->validated(),  
        JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT  
    ) . PHP_EOL,  
    FILE_APPEND | LOCK_EX  
);
```