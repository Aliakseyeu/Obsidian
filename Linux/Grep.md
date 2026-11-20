#linux  #bash 

[[Linux]]
[[Bash]]

Эта команда найдет найдет строки с двумя вхождениями и подсветит вхождения

```bash
grep -iE --color=always 'some_text' access.log | grep -E --color=always 'another'
```

[[Color]]
[[i]] 
[[E]]