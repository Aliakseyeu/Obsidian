
config/web.php

```php
'components' => [  
    'log' => [  
        'targets' => [  
            [  
                'class' => yii\log\FileTarget::class,  
                'levels' => ['info', 'error'],  
                'categories' => [
	                'yii\db\Command::query', 
	                'yii\db\Command::execute'
	            ],  
                'logVars' => [],  
            ],  
        ],  
    ],
]
```

Теперь в runtime/logs/app.log можно посмотреть список запросов