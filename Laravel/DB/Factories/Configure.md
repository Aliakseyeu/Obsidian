Метод, который вызывается **после создания экземпляра фабрики**, но **перед созданием модели**. Используется для настройки фабрики.

```php
class UserFactory extends Factory
{
    public function definition(): array
    {
        return [
            'name' => fake()->name(),
            'email' => fake()->unique()->safeEmail(),
            'status' => 'pending',
        ];
    }
    
    public function configure(): static
    {
        return $this->afterMaking(function (User $user) {
            // Вызывается после создания экземпляра, но перед сохранением
            if (!$user->password) {
                $user->password = bcrypt('password');
            }
        })->afterCreating(function (User $user) {
            // Вызывается после сохранения модели в БД
            if ($user->status === 'active') {
                $user->profile()->create([
                    'bio' => fake()->paragraph(),
                ]);
            }
        });
    }
}
```

```php
class ProductFactory extends Factory
{
    public function definition(): array
    {
        return [
            'name' => fake()->productName(),
            'price' => fake()->randomFloat(2, 1, 1000),
            'stock' => fake()->numberBetween(0, 100),
        ];
    }
    
    public function configure(): static
    {
        return $this->afterMaking(function (Product $product) {
            // Если товар без категории - назначаем случайную
            if (!$product->category_id) {
                $category = Category::inRandomOrder()->first();
                if ($category) {
                    $product->category_id = $category->id;
                }
            }
        })->afterCreating(function (Product $product) {
            // Для дорогих товаров создаем расширенную информацию
            if ($product->price > 500) {
                $product->details()->create([
                    'warranty' => '2 years',
                    'features' => json_encode(['premium' => true]),
                ]);
            }
            
            // Для товаров в наличии создаем SKU
            if ($product->stock > 0) {
                $product->update(['sku' => 'SKU-' . strtoupper(Str::random(8))]);
            }
        });
    }
}
```