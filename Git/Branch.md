[[Git]]

### 1. Создать новую ветку

`git branch my-feature`

### 2. Переключиться на неё

`git checkout my-feature`

---

📌 Но обычно делают это одной командой:

`git checkout -b my-feature`

- `-b` → создаёт ветку
- `checkout` → сразу переключает на неё

---

### 3. Проверить, в какой ветке ты сейчас

`git branch`

Текущая ветка будет отмечена `*`.

---

⚡️ Начиная с Git 2.23 вместо `checkout` можно использовать:

```
git switch -c my-feature   # создать и переключиться 
git switch my-feature      # просто переключиться
```

### Перенос изменений в другую ветку
[[Перенос изменений в другую ветку]]

---

### Переименовать ветку

|Ситуация|Команда|
|---|---|
|**Локальная ветка**|`git branch -m old new`|
|**Текущая ветка**|`git branch -m new-name`|
|**+ Remote**|`git push origin --delete old` + `git push origin -u new`|
|**Обновить tracking**|`git branch -u origin/new new`|

Всегда проверяйте `git status` и `git branch -avv` после переименования, чтобы убедиться, что всё работает правильно!