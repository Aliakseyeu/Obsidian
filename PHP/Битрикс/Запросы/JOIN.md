```php
protected static function prepareResult($lastTimeExec = "")  
{  
   $query = new Query(ElementTable::getEntity());  
  
   $query->setSelect([  
      "ID",  
      "NAME",  
      "IBLOCK_ID",  
      "IBLOCK_NAME" => "IBLOCK.NAME"  
   ]);  
   $query->setFilter([  
      ">DATE_CREATE" => $lastTimeExec ?: (new BitrixDateTime())->add("-1 day"),  
   ]);  
   $query->setOrder([  
      "IBLOCK_ID" => "ASC",  
   ]);  
   $query->registerRuntimeField("IBLOCK", [  
      "data_type" => IblockTable::class,  
      "reference" => [  
         "=this.IBLOCK_ID" => "ref.ID"  
      ]  
      // ,"join_type" => "LEFT" - для левого соединения
   ]);  
  
   return $query->exec()->fetchAll();  
}
```

Этот код из Битрикс-D7 ORM добавляет **виртуальное (runtime) вычисляемое поле** к запросу, чтобы можно было присоединить таблицу `b_iblock` (модель `IblockTable`) без явного описания её в модели.

Разберём по шагам:

---

### 1. `$query->registerRuntimeField("IBLOCK", [...])`

Метод **`registerRuntimeField`** позволяет _на лету_ добавить к запросу новое поле (или связь), которое изначально не определено в описании сущности.

В данном случае добавляется поле с названием `"IBLOCK"`.

---

### 2. `"data_type" => IblockTable::class`

Здесь указывается **тип данных** — это класс ORM-сущности, с которой будет связь.  
`IblockTable::class` → это `Bitrix\Iblock\IblockTable`, ORM-обёртка над таблицей `b_iblock`.

---

### 3. `"reference" => [ "=this.IBLOCK_ID" => "ref.ID" ]`

**`reference`** — условие связывания таблиц (аналог `JOIN ON` в SQL).

- `=this.IBLOCK_ID` → поле `IBLOCK_ID` из основной таблицы запроса (та, для которой мы пишем `$query`).
    
- `ref.ID` → поле `ID` из присоединяемой таблицы `IblockTable`.
    
- Знак `=` в начале (`=this`) означает **строгое сравнение** (Bitrix ORM синтаксис).
    

---

### 4. Что это делает в SQL

Если, например, основной запрос строится по `ElementTable`, то этот код фактически добавит **`INNER JOIN b_iblock ON element.IBLOCK_ID = iblock.ID`**.