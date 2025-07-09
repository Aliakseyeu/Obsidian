
```bash
alias ll="ls -la"

c() {
    cd "/var/www/www-root/data/www/$1"
}

aap() {
    c "alfa.alfasad_private"
}

ap() {
    c "alfastok_private"
}

pa() {
    sudo -u www-root php artisan $1
}
```
