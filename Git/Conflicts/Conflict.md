```plantuml
branch1_local -> branch1_remote : push
branch2_local -> branch2_remote : push
branch1_remote -> epic_remote : merge
branch2_remote -[#red]> epic_remote : merge
note right
  Conflict
end note
epic_remote -> epic_local : fetch
epic_local -> branch2_local : merge
branch2_local -> branch2_local : fix conflicts
branch2_local -> branch2_remote : push
branch2_remote -[#green]> epic_remote : merge
```
