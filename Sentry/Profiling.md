
```php
Sentry::startProfiling('name');
// Код который должен выполниться за 30 секунд и дойти до конца профилировщика
Sentry::endProfiling();
```