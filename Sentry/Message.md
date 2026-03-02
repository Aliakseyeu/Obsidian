
```php
$scope = new CustomSentryScope('ecex', []);  
Sentry::messageWithScope('joba', $scope);
```


```php
Sentry::captureMessage('test');
```