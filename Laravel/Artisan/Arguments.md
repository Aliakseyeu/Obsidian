#php 

[[Laravel]]
[[Artisan]]

---
**Arguments**

```php
protected $signature = 'items:import {category} {limit}';
// Required params
protected $signature = 'items:import {category?}';
// Optional param
protected $signature = 'items:import {category=all}';
// Default value
protected $signature = 'items:import {ids*}';
// List of values - php artisan items:import 10 20 30

$ids = $this->argument('ids');
$arguments = $this->arguments();
```

---
**Options**

```php
protected $signature = 'items:import {--force}';
// php artisan items:import --force
protected $signature = 'items:import {--limit=}';
// With value - php artisan items:import --limit=100
protected $signature = 'items:import {--limit=100}';
// Default value
protected $signature = 'items:import {--id=*}';
// List of values - php artisan items:import --id=10 --id=20 --id=30

$force = $this->option('force'); // true or false
$options = $this->options();
```

---
**Call**

```php
$this->call('items:import', [
    'category' => 'electronics',
    '--limit' => 500,
    '--force' => true,
]);
```