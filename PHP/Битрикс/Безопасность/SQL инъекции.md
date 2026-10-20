
```php
$value = !$this->arResult['NOTIFICATION']['IS_IMPORTANT'];
NotificationTable::update($notificationId, ['IS_IMPORTANT' => $value]);
```

В текущем примере у нас булевый переключатель. Поэтому нам не обязательно получать данные от клиента. Нам достаточно инвертировать текущее значение.

Если попытаться обновить поля начинающиеся с ~, то значения не будут экранироваться

Совершенно не экранируются методы
- CDatabase::Insert
- CDatabase::Update