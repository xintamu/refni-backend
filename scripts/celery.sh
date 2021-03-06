if [ "$1" == "" ] || [ $# -gt 1 ]; then
    echo "Usage: scripts/celery.sh {start|restart|stop}"
    echo "And remember to run it at project root."
    exit 0
fi

basepath="/home/yfliu/.celery-tmp"
pidpath="${basepath}/run/%n.pid"
logpath="${basepath}/log/%n%I.log"

if [ "$1" == "start" ]
then
    celery multi start worker1 -A refni_backend --logfile=$logpath --pidfile=$pidpath -l info
elif [ "$1" == "stop" ]
then
    celery multi stop worker1 --pidfile=$pidpath
elif [ "$1" == "restart" ]
then
    celery multi restart worker1 --pidfile=$pidpath
else
    echo "Unknown command: $1"
fi
