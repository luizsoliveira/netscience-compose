# netscience-compose
Docker compose IaC for all Netscience modules

## Install
```bash
cd /opt
sudo git clone --recurse-submodules https://github.com/luizsoliveira/netscience-compose
cd netscience-compose/
git config --global --add safe.directory /opt/netscience-compose
cp netscience.service /etc/systemd/system/netscience.service
systemctl enable netscience
```

## Version update
```bash
cd /opt/netscience-compose/
git pull --recurse-submodules
```

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
