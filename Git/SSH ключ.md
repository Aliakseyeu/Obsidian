#git #ssh

### Создание ключа

```bash
# Генерация
ssh-keygen -t ed25519 -C "your_email@example.com"

# Регистрация в SSH-агенте
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Копирование
cat ~/.ssh/id_ed25519.pub
```

### Регистрация
- [github.com](https://github.com/settings/keys)
- New SSH key
- Title - Любой
- Key -  содержимое `id_ed25519.pub`
- Add SSH key

### Проверка соединения

```bash
ssh -T git@github.com
```
