#linux #bash 

[[Linux]]
[[Grep]]
[[Bash]]
### Поиск с учетом маски имени файл
```bash
find . -iname '*pattern*' -exec grep -r -A 3 --color 'pattern' {} +
```

```bash
grep -C 10 "pattern" /path/to/file
```
### Поиск в архивах

[[For]]

---

Поиск внутри архива

```bash
zgrep -i 'my/url' access.log.*.gz
```