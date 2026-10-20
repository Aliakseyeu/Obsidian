
```php
/**
 * @impure
 */
```

---

```php
private function process(): void
{  
    $class = new Class();
    $class->setValue(0);
    $this->check($class);
    $class->setValue(1);
    $this->check($class);
}

private function check(Class $class): bool  
{  
    return $class->getValue() > 0;  
}
```

---

Докблок для прохождения ошибки стана. В примере выше при повторном вызове метода check будет ошибка стана. Он будет считать что метод вернет тот же результат, не смотря на то что между вызовами мы обновили значение свойства value. Чтобы избежать этой проблемы нужно у метода check указать докблок impure, который скажет что метод не чистый и каждый раз может вернуть разное значение

---

[[Pure & Impure]] 
[[PHP Stan]]