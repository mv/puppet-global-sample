#!/bin/bash

# mongod - Startup script for mongod

# chkconfig: 35 85 15
# description: Mongo is a scalable, document-oriented database.
# processname: mongod
# config: /etc/mongod.conf
# pidfile: /var/run/mongo/mongod.pid

###
### ATTENTION! ATTENTION! ATTENTION!
###     This file is managed by Puppet.
###     Any local modifications will be lost in the next puppet run.
### ATTENTION! ATTENTION! ATTENTION!
###

. /etc/rc.d/init.d/functions

# things from mongod.conf get there by mongod reading it


# NOTE: if you change any OPTIONS here, you get what you pay for:
# this script assumes all options are in the config file.
CONFIGFILE="/etc/mongod.conf"
OPTIONS=" -f $CONFIGFILE"
SYSCONFIG="/etc/sysconfig/mongod"

# FIXME: 1.9.x has a --shutdown flag that parses the config file and
# shuts down the correct running pid, but that's unavailable in 1.8
# for now.  This can go away when this script stops supporting 1.8.
DBPATH=`awk -F= '/^dbpath\s*=/{print $2}' "$CONFIGFILE"`
PIDFILE=${DBPATH}/mongod.lock
PIDFILEPATH=`awk -F= '/^pidfilepath\s*=/{print $2}' "$CONFIGFILE"`
mongod=${MONGOD-/usr/bin/mongod}

MONGO_USER=mongod
MONGO_GROUP=mongod

if [ -f "$SYSCONFIG" ]; then
    . "$SYSCONFIG"
fi

# Handle NUMA access to CPUs (SERVER-3574)
# This verifies the existence of numactl as well as testing that the command works
NUMACTL_ARGS="--interleave=all"
if which numactl >/dev/null 2>/dev/null && numactl $NUMACTL_ARGS ls / >/dev/null 2>/dev/null
then
    NUMACTL="numactl $NUMACTL_ARGS"
else
    NUMACTL=""
fi

start()
{
  echo -n $"Starting mongod: "
  daemon --user "$MONGO_USER" $NUMACTL $mongod $OPTIONS
  RETVAL=$?
  echo
  [ $RETVAL -eq 0 ] && touch /var/lock/subsys/mongod && ln -nsf $PIDFILE $PIDFILEPATH
}

stop()
{
  echo -n $"Stopping mongod: "
  killproc -p "$PIDFILE" -d 300 /usr/bin/mongod
  RETVAL=$?
  echo
  [ $RETVAL -eq 0 ] && rm -f /var/lock/subsys/mongod
}

restart () {
	stop
	start
}

ulimit -n 12000
RETVAL=0

case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  restart|reload|force-reload)
    restart
    ;;
  condrestart)
    [ -f /var/lock/subsys/mongod ] && restart || :
    ;;
  status)
    status $mongod
    RETVAL=$?
    ;;
  *)
    echo "Usage: $0 {start|stop|status|restart|reload|force-reload|condrestart}"
    RETVAL=1
esac

exit $RETVAL
