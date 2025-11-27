
```bash
ssh-keygen -t ed25519 -f ~/.ssh/myproject_gitlab_key -C "gitlab repo key"
```
Расшифровка параметров:
- t ed25519 — современный тип ключа (лучше, чем RSA)
- f ~/.ssh/myproject_gitlab_key — имя файла ключа (приватный) будет создан также ~/.ssh/myproject_gitlab_key.pub (публичный)
- C "gitlab repo key" — метка (видна в GitLab)
Нажимай Enter, когда попросит passphrase (можно оставить пустым).

---

Открой GitLab:
**Preferences → SSH Keys**  
Скопируй содержимое файла:
`cat ~/.ssh/myproject_gitlab_key.pub`
Вставь в поле **Key** → нажми **Add key**.

---

Открой config:
`nano ~/.ssh/config`
Добавь:
```
Host gitlab-myproject
     HostName gitlab.by
     User git
     IdentityFile ~/.ssh/myproject_gitlab_key
     IdentitiesOnly yes
     Port 22   # Или твой порт, если он другой (например 2222 или 443) можно посмотреть в ссылке для клонирования репозитория
```
Сохрани.

- `Host gitlab-myproject` — псевдоним (alias)
- `IdentityFile` — указывает конкретный SSH ключ
- `Port` — указать правильный порт GitLab
- `IdentitiesOnly yes` — запрещает использовать другие ключи

---

Если у тебя уже есть репозиторий — поменяй URL:
```bash
git remote set-url origin git@gitlab-myproject:group/project.git
```

Если клонируешь новый:
```bash
git clone git@gitlab-myproject:group/project.git
```

---

```bash
ssh -T git@gitlab-myproject
```
Увидишь:

```
Welcome to GitLab, @username!
```

Если видишь это сообщение — всё работает 🎉