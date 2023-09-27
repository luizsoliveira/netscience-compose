# netscience-compose
Docker compose IaC for all Netscience modules

## Services
* Admin interface at: http://localhost:7000/
* REST API at: http://localhost:7001/
* Websocket at: http://localhost:7002/
  * Stdout Demo Monitor Changes: http://localhost:7002/task_simple?taskId=
* Swagger at: http://localhost:7880/
* PgAdmin at: http://localhost:7500/
* Postgres at: localhost:7432


## Git Submodules
* App Submodules
  * git submodule add https://github.com/luizsoliveira/netscience-admin app/admin
  * git submodule add https://github.com/luizsoliveira/netscience-api app/api
  * git submodule add https://github.com/luizsoliveira/netscience-websocket app/websocket
* Netscence nodes submodules
  * git submodule add https://github.com/luizsoliveira/netscience-cyberdefense nodes/cyberdefense
