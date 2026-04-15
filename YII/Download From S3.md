
```php
public function downloadExport(string $fileName): void  
{  
    /**  
     * @var S3Filesystem $s3  
     */  
    $s3 = Yii::$app->s3;  
  
    $stream  = $s3->readStream(
	    DiskS3::Name, 
	    $fileName
	);  
  
    Yii::$app
	    ->response
		->sendStreamAsFile(  
	        $stream,  
	        $fileName,  
	        [
		        'fileSize' => $s3
			        ->fileSize(
				        DiskS3::Name, 
				        $fileName
					)
			]  
	    )
	    ->send();  
}
```