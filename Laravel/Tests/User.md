
```php
private ?User $user = null;

private function setUser(): void  
{  
    $this->user = User::query()
    ->where('id', '=', config('mock_user_id'))
    ->first();  
}  
  
private function setPermissionToUser(PermissionEnum $permission): void  
{  
    $permission = Permission::query()
	    ->where('name', '=', $permission)
	    ->first();  
  
    $this->user->givePermissionTo($permission);  
}
```

Таким образом можно установить пользователя и дать ему спатти пермишены. Тест сам подхватит из приватного поля.

---

[[WithoutMiddleware]]