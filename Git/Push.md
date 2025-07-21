
- Клонировать репозиторий

Или

- git init
- git add .
- git commit -m "."
- git remote add origin (ssh ссылка)
- Создать ключ [[SSH ключ]]
- ssh-keygen -t ed25519 -C "ваш_email@example.com"
- Добавить в GitHub публичную часть
- Проверить подключение ssh -T git@github.com
- Если нужно перевести репозиторий на ssh - git remote set-url origin git@github.com:ваш_username/репозиторий.git
- git push -u origin master