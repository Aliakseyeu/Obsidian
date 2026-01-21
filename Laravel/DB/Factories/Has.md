
Метод для создания связанных моделей через отношения Eloquent.

---

### Один к одному

```php
class UserFactory extends Factory
{
    public function definition(): array { ... }
    
    public function withProfile(): static
    {
        // Создает ОДИН связанный профиль
        return $this->has(
            Profile::factory(), // Фабрика связанной модели
            'profile'           // Имя отношения (метод в модели User)
        );
    }
}
```

---

### Один ко многим

```php
class UserFactory extends Factory
{
    public function definition(): array { ... }
    
    public function withPosts($count = 3): static
    {
        // Создает НЕСКОЛЬКО связанных постов
        return $this->has(
            Post::factory()->count($count), // Фабрика с количеством
            'posts'                         // Имя отношения
        );
    }
    
    public function withOrders(): static
    {
        // Альтернативный синтаксис
        return $this->has(
            Order::factory()->count(rand(1, 5))
                ->state(function (array $attributes, User $user) {
                    // Можно использовать атрибуты родительской модели
                    return [
                        'user_id' => $user->id,
                        'email' => $user->email, // Копируем email пользователя
                    ];
                }),
            'orders'
        );
    }
}
```

---

### Многие ко многим

```php
class ProjectFactory extends Factory
{
    public function definition(): array { ... }
    
    public function withTeam($count = 5): static
    {
        return $this->has(
            User::factory()->count($count),
            'team', // Отношение многие-ко-многим
            function (array $attributes, Project $project) {
                // Дополнительные данные для pivot-таблицы
                return [
                    'project_id' => $project->id,
                    'joined_at' => now(),
                    'role' => fake()->randomElement(['developer', 'manager', 'designer']),
                ];
            }
        );
    }
}
```