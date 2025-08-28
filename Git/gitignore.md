
Добавляем файл в .gitignore
Если файлы уже отслеживаются, то нужно выполнить:

```
git rm -r --cached path/to/package-lock.json
```

- -r - рекурсивно
- --cached - удаление только из репозитория, а не с диска

```
git commit
```