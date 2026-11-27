
```php
CarbonImmutable::createFromFormat('!Y-m', $request->report_month);
```

Модификатор **`!`** (восклицательный знак) в формате `createFromFormat()` **обнуляет все не указанные в формате компоненты даты/времени**.

// Без модификатора '!'
CarbonImmutable::createFromFormat('Y-m', '2024-03');
// Результат: 2024-03-23 12:45:30 (текущие день, время)

// С модификатором '!'
CarbonImmutable::createFromFormat('!Y-m', '2024-03');
// Результат: 2024-03-01 00:00:00 (начало месяца)