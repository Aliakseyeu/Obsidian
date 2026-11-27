
```php
use Tests\TestCase;
use Illuminate\Foundation\Testing\DatabaseTransactions;

class TestAuditLogging extends TestCase  
{  
    use DatabaseTransactions;
}
```

Этот трейт **автоматически оборачивает каждый тест в транзакцию БД** и откатывает ее после завершения теста.

```php
// В каждом тесте:
BEGIN TRANSACTION;
    // Выполняется тест с любыми операциями БД
    // Все изменения в БД
ROLLBACK; // После теста все изменения откатываются
```

[[RefreshDatabase]]