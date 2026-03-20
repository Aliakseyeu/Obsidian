
```php
$response = Yii::$app->response;
$response->format = Response::FORMAT_JSON;
$response->statusCode = 422;
$response->data = $errors;
$response->send();

exit(0);
```