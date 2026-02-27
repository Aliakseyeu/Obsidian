

Создать миграцию

```bash
php yii migrate/create update_some_table
```

---

Посмотреть последние 10 миграций или 5

```bash
php yii migrate/history
php yii migrate/history 5
```

---

Посмотреть какие еще не выполнены

```bash
php yii migrate/new
```

---

Выполнить миграции или определенную

```bash
php yii migrate
php yii migrate/up m240226_130000_extend_status_enum
```

---

Откатить последнюю миграцию, несколько или до определенной

```bash
php yii migrate/down
php yii migrate/down 3
php yii migrate/to m240226_120000_create_users_table
```