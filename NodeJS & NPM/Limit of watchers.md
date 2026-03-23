
System limit for number of file watchers reached

Это ошибка **системы Linux**, а не вашего кода или Node.js. Она возникает, когда процесс (обычно сборщик вроде Webpack, Vite, Laravel Mix) пытается отслеживать изменения в файлах, но **исчерпан лимит на количество файловых наблюдателей (inotify watchers)** в системе.

```bash
sudo sysctl fs.inotify.max_user_watches=524288
sudo sysctl -p
```