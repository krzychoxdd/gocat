# Install

### PostgreSQL

`source export_env.sh && make pgup`

### Tika

Tika to oprogramowanie do przetwarzania tekstu z roznych formatow

https://tika.apache.org/

#### Instalation


### Migrate database

`source export_env.sh && make migrate`

### Run

`make pgup`
`make tikaup`
`go src/handlers/server.go` 
