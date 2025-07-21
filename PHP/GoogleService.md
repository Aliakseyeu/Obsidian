
```php
<?php

  
namespace App\Services;
  
use Google_Client;
use Google_Service_Sheets;
use Google_Service_Sheets_BatchUpdateSpreadsheetRequest;
use Google_Service_Sheets_Request;
use Google_Service_Sheets_SheetProperties;
use Google_Service_Sheets_UpdateSheetPropertiesRequest;
use Google_Service_Sheets_ValueRange;

class GoogleService
{
   public readonly Google_Service_Sheets $client;
    public readonly string $spreadsheetId;
  
    public function __construct()
    {
        $this->spreadsheetId = config('google_sheet.google_sheet_repairs');
        $this->client = $this->createService();
    }

    /** Создание сервиса */
    private function createService(): Google_Service_Sheets
    {
        $client = new Google_Client();
        $client->setAuthConfig(storage_path('chat-bot.json'));
        $client->addScope("https://www.googleapis.com/auth/spreadsheets");

        return new Google_Service_Sheets($client);
    }

    /** Созадание листа */
    public function createSheet(string $title): void
    {
        $body = new Google_Service_Sheets_BatchUpdateSpreadsheetRequest(array(
            'requests' => [
                'addSheet' => [
                    'properties' => [
                        'title' => $title
                    ]
                ],
            ]
        ));
        $this->client->spreadsheets->batchUpdate($this->spreadsheetId, $body);
    }

    /** Удалить лист */
    public function deleteList(int $listId): void
    {
        $body = new Google_Service_Sheets_BatchUpdateSpreadsheetRequest(array(
            'requests' => array('deleteSheet' => array('sheetId' => $listId))
        ));
        $this->client->spreadsheets->batchUpdate($this->spreadsheetId, $body);
    }

    /** Вставить строку */
    public function insertRow(string $range, array $values): void
    {
        $body = new Google_Service_Sheets_ValueRange(['values' => $values,]);
        $params = ['valueInputOption' => 'USER_ENTERED',];
        try {
            $this->client->spreadsheets_values->update($this->spreadsheetId, $range, $body, $params);
        } catch (\Exception $th) {
            dd($th->getMessage(), $values[count($values) - 1]);
            abort(500);
        }
    }

    /** Переименовать лист */
    public function renameList(int $index, string $title): void
    {
        $titleProp = new Google_Service_Sheets_SheetProperties();
        $titleProp->setSheetId($index);
        $titleProp->setTitle($title);
  
        $renameReq = new Google_Service_Sheets_UpdateSheetPropertiesRequest();
        $renameReq->setProperties($titleProp);
        $renameReq->setFields('title');
        $request = new Google_Service_Sheets_Request();
        $request->setUpdateSheetProperties($renameReq);
  
        $batchUpdateRequest = new Google_Service_Sheets_BatchUpdateSpreadsheetRequest();
        $batchUpdateRequest->setRequests([$request]);
        $this->client->spreadsheets->batchUpdate($this->spreadsheetId, $batchUpdateRequest);
    }

    /** Установить настройки */
    public function setSettings(array $settings = []): void
    {
        $settings = array_merge([
            'requests' => [
                [
                    'updateSpreadsheetProperties' => [
                        'properties' => ['locale' => 'en_US'], // Установите локаль США (точка как разделитель)
                        'fields' => 'locale'
                    ]
                ]
            ]
        ], $settings);
        $request = new Google_Service_Sheets_BatchUpdateSpreadsheetRequest($settings);

        $this->client->spreadsheets->batchUpdate($this->spreadsheetId, $request);
    }

    /** Получить листы */
    public function getSheets(): array
    {
        return $this->client->spreadsheets->get($this->spreadsheetId)->getSheets();
    }

    public function getListName(): string
    {
        return  "temp_list_" . rand(1000, 9999);
    }
}
```

```php
 $headers = ['id', '1c_id', 'profile_unp', 'serial', 'receipt_date', 'shipment_date', 'check_date', 'return_item', 'repair_type', 'repair_sum', 'paid', 'name', 'state', 'comment', 'works', 'created_at', 'updated_at', 'company_name'];
        $select = ['repairs.id', 'id_1c', 'profiles.unp', 'serial', 'receipt_date', 'shipment_date', 'check_date', 'return_item', 'repair_type', 'repair_sum', 'paid', 'repairs.name', 'state', 'comment', 'works', 'repairs.created_at', 'repairs.updated_at', 'profiles.company_name'];
        $repairs = Repair::select($select)
            ->leftJoin('profiles', 'profiles.id', '=', 'profile_id')
            ->orderByDesc('repairs.id')
            ->get()
            ->toArray();

        $repairs = array_map(fn($repair) => array_map('strval', $repair), $repairs);
        $repairs = array_map('array_values', $repairs);
  
        $client = new GoogleService();
        $listName = $client->getListName();
        $client->createSheet($listName);
        // собираем все листы
        $sheets = $client->getSheets();
        $lastSheetIndex = count($sheets) - 1;
        $client->setSettings();
        $client->insertRow($listName . "!A1", [$headers]);
        $numRow = 2;
        $client->insertRow($listName . "!A" . $numRow, $repairs);
        $numRow += count($repairs);
        // обнуляем массив
        $repairs = [];
        $client->renameList($sheets[$lastSheetIndex]->getProperties()['sheetId'], 'Repairs');
        for ($i = 0; $i < $lastSheetIndex; $i++) {
            // узнаем индекс листа
            $listId = $sheets[$i]->getProperties()['sheetId'];
            $client->deleteList($listId);
        }
        $spreadsheet = $client->client->spreadsheets->get($client->spreadsheetId);
        $sheetProperties = $spreadsheet->getSheets()[0]->getProperties();
        $sheetId = $sheetProperties->sheetId;
```