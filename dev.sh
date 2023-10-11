#!/bin/bash
# Script to manage the netscience service

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

#Stopping the application
Stop() {
    echo "Stopping netscience service.";
    docker compose --env-file $SCRIPTPATH/.env.development -f $SCRIPTPATH/docker-compose-dev.yml down;
    echo "Stopped.";
}

#Starting the application
Start() {
    echo "Starting netscience service.";
    docker compose --env-file $SCRIPTPATH/.env.development -f $SCRIPTPATH/docker-compose-dev.yml up;
}

#Starting the application
Status() {
    echo "Listing containers process.";
    docker compose --env-file $SCRIPTPATH/.env.development -f $SCRIPTPATH/docker-compose-dev.yml ps;
}

#Updating the source code
Update() {
    echo "Updating the source code";
    cd $SCRIPTPATH
    git pull --recurse-submodules
}

case "$1" in
    
    start)
        Stop;
        Start
    ;;

    stop)
        Stop
    ;;

    status)
        Status
    ;;

    restart)
        Stop;
        Start
    ;;
    
    update)
        Stop;
        Update;
        Start
    ;;

    *)
        echo "Usage: dev.sh start|stop|restart|status|update"
        exit 1
    ;;
esac




