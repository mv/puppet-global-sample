#!/bin/sh
#
# redis        init file for starting up the redis daemon
#
# chkconfig:   - 20 80
# description: Starts and stops the redis daemon.

###
### ATTENTION! ATTENTION! ATTENTION!
###     This file is managed by Puppet.
###     Any local modifications will be lost in the next puppet run.
### ATTENTION! ATTENTION! ATTENTION!
###

# Source function library.
. /etc/rc.d/init.d/functions

name="redis-server"
exec="/usr/sbin/$name"
pidfile="/var/run/redis/redis.pid"
REDIS_CONFIG="/etc/redis.conf"

[ -e /etc/sysconfig/redis ] && . /etc/sysconfig/redis

lockfile=/var/lock/subsys/redis

/sbin/sysctl vm.overcommit_memory=1 &> /dev/null

start() {
    [ -f $REDIS_CONFIG ] || exit 6
    [ -x $exec ] || exit 5
    echo -n $"Starting $name: "
    daemon --user ${REDIS_USER-redis} "$exec $REDIS_CONFIG"
    retval=$?
    echo
    [ $retval -eq 0 ] && touch $lockfile
    return $retval
}

stop() {
    echo -n $"Stopping $name: "
    killproc -p $pidfile $name
    retval=$?
    echo
    [ $retval -eq 0 ] && rm -f $lockfile
    return $retval
}

restart() {
    stop
    start
}

reload() {
    false
}

rh_status() {
    status -p $pidfile $name
}

rh_status_q() {
    rh_status >/dev/null 2>&1
}


case "$1" in
    start)
        rh_status_q && exit 0
        $1
        ;;
    stop)
        rh_status_q || exit 0
        $1
        ;;
    restart)
        $1
        ;;
    reload)
        rh_status_q || exit 7
        $1
        ;;
    force-reload)
        force_reload
        ;;
    status)
        rh_status
        ;;
    condrestart|try-restart)
        rh_status_q || exit 0
        restart
        ;;
    *)
        echo $"Usage: $0 {start|stop|status|restart|condrestart|try-restart}"
        exit 2
esac
exit $?

