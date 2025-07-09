
```php
$xml = new \SimpleXMLElement('<?xml version="1.0" encoding="utf-8"?><data></data>');
$xml->addAttribute('version', '1.0');
$xml->addChild('type', 'request');
$xml->addChild('id', $event->order->id);
$xml->addChild('address', $event->order->address);
$xml->addChild('email', $event->order->profile->email);
$xml->addChild('agreement', $event->order->agreement_uuid);
$xml->addChild('sum', $event->order->price);
$xml->addChild('comment', htmlspecialchars($event->order->comment));
$xml->addChild('products');
foreach ($event->order->items as $itemOrder) {
	$product = $xml->products->addChild('product');
	$product->addChild('uuid', $itemOrder->uuid);
	$product->addChild('amount', $itemOrder->pivot->item_count);
	$product->addChild('sum', $itemOrder->pivot->item_sum_price);
}
$XMLHelper = new XMLHelper();
$xml = $XMLHelper->beauty_xml($xml);
```