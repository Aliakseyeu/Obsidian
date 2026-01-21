
users
    id
    name

roles
    id
    name

role_user (pivot)
    user_id
    role_id

permissions
    id
    name

permission_role (pivot)
    permission_id
    role_id
   
---

```php
class User extends Model
{
	public function permissions()
    {
        return $this->hasManyThrough(
            Permission::class,
            Role::class,
            'user_id',
            'id',
            'id',
            'role_id'
        );
    }
}
```

- Конечная модель
- Промежуточная модель
- Внешний ключ в промежуточной таблице (role_user) на текущую модель
- Локальный ключ в конечной модели (permissions)
- Локальный ключ в текущей модели (users)
- Внешний ключ в промежуточной таблице (permission_role) на конечную модель