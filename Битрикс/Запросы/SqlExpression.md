```php
$sqlExpression = new \Bitrix\Main\DB\SqlExpression('DATE_ADD(DATE_CREATE, INTERVAL ?i DAY)', $days);

$filter = ['<DATE_MODIFY' => $sqlExpression];
```