
```php
return new class extends Migration  
{  
    public function up(): void  
    {  
        Schema::table('some_tables', function (Blueprint $table) {  
            $table->foreignIdFor(MyModel::class)  
                ->nullable()  
                ->after('my_column')  
                ->comment('my_comment')  
                ->constrained();  
        });  
    }  
  
    public function down(): void  
    {  
        Schema::table('some_tables', function (Blueprint $table) {  
            $table->dropForeign('some_tables_my_model_id_foreign');  
            $table->dropColumn('my_model_id');  
        });  
    }  
};
```