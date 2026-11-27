
```php
<?php  
  
use PHPUnit\Framework\TestCase;  
use yii\console\Application;  
use yii\db\Transaction;  
use yii\helpers\ArrayHelper;  
  
class AccountTest extends TestCase  
{  
    private Application $consoleApp;  
    private Transaction $transaction;  
  
    protected function setUp(): void  
    {  
        parent::setUp();  
  
        $this->consoleApp = $this->initConsoleApp();  
  
        $this->transaction = Yii::$app->db->beginTransaction();  
    }  
  
    protected function tearDown(): void  
    {  
        $this->transaction->rollBack();  
  
        parent::tearDown();  
    }  
  
    private function initConsoleApp(): Application  
    {  
        return new Application(  
            ArrayHelper::merge(  
                require Yii::getAlias('@app/config/console.php'),  
                [  
                    'components' => [  
                        'db' => Yii::$app->db,  
                    ]  
                ]  
            )  
        );  
    }  
}
```