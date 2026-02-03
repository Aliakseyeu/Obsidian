
```php
$path = APPLICATION_DIRECTORY.'tmp/file.xlsx';

$spreadsheet = IOFactory::load($path);

$sheet = $spreadsheet->getActiveSheet()->toArray();
```