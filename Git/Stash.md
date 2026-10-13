[[Git]]
[[Copy Files]]
[[CherryPick]]

Можно применить для переноса изменений в другую ветку, если изменения еще не были закоммичены

```bash
git checkout branch-for-remove

git stash

git checkout branch-for-insert

git stash pop
```