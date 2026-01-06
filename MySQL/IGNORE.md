

```sql
INSERT IGNORE INTO table
```

Что делает IGNORE? Он:

- подавляет ошибки (warnings вместо errors)
- **игнорирует нарушения**, кроме duplicate ke    
- может скрыть реальные проблемы ❗    

⚠️ В связке с `ON DUPLICATE KEY UPDATE`:

- `IGNORE` **почти всегда лишний**   
- может замаскировать ошибки типов / переполнений