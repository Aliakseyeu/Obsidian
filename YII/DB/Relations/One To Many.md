
Добавление

```php
foreach ($data as $value) {  
    $relatedModel = new RelatedModel([  
        'value' => $value,  
    ]);  
    $model->link('relation', $relatedModel);  
}
```

---

Удаление

```php
$model->unlinkAll('relation', true);
```

**true** нужен для того чтобы orm физически удалила записи, иначе она проставит 0 в поле связи

---

Если нужно отвязать только определенные

```php
$campaigns = $account->getCampaigns()
    ->andWhere(['status' => 'inactive'])
    ->all();

foreach ($campaigns as $campaign) {
    $account->unlink('campaigns', $campaign, true);
}