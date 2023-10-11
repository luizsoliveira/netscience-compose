#!/bin/bash
# Script to manage the netscience service

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

#Stopping the application
Stop() {
    echo "Stopping netscience service.";
    docker compose --env-file $SCRIPTPATH/.env.production -f $SCRIPTPATH/docker-compose-prod.yml down;
    echo "Stopped.";
}

#Starting the application
Start() {
    echo "Generating the React Admin JS bundle.";
    docker compose --env-file $SCRIPTPATH/.env.production -f $SCRIPTPATH/docker-compose-prod.yml build react-admin --no-cache
    echo "Starting netscience service.";
    docker compose --env-file $SCRIPTPATH/.env.production -f $SCRIPTPATH/docker-compose-prod.yml up;
    echo "Started.";
}

#Starting the application
Status() {
    echo "Listing containers process.";
    docker compose --env-file $SCRIPTPATH/.env.production -f $SCRIPTPATH/docker-compose-prod.yml ps;
}

#Updating the source code
Update() {
    echo "Updating the source code";
    cd $SCRIPTPATH
    git pull --recurse-submodules
}

case "$1" in
    
    start)
        Stop
        Start
    ;;

    stop)
        Stop
    ;;

    status)
        Status
    ;;

    restart)
        Stop
        Start
    ;;

    update)
        Stop;
        Update;
    ;;

    *)
        echo "Usage: prod.sh start|stop|restart|status|update"
        exit 1
esac




