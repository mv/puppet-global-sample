# Puppet: Cron Daemon


Cron Daemon

This module controls a default Operating System Package.


### Usage

##### cron

    # install
    include cron
    include cron::install

### itens created

    /etc/init.d/crond
    /etc/sysconfig/crond
    /etc/cron.deny
    /etc/cron.d/0hourly
    /etc/cron.d/dailyjobs


# vim:ft=markdown

