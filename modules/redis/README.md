# Puppet: Redis

This module depends on repo_eden_rpm.

Reference:

 * http://redis.io/
 * https://raw.github.com/antirez/redis/2.4/00-RELEASENOTES
 * https://raw.github.com/antirez/redis/2.6/00-RELEASENOTES
 * http://pkgs.org/centos-6-rhel-6/epel-x86_64/redis-2.4.10-1.el6.x86_64.rpm.html
 * http://pkgs.org/centos-6-rhel-6/centalt-x86_64/redis-2.4.17-1.el6.x86_64.rpm.html
 * http://pkgs.org/download/redis
 * http://centos.alt.ru/repository/centos/6/x86_64/


### Usage

##### redis

    # install
    include redis
    include redis::install

    # remove
    include redis::remove

    # user
    include redis::user
    include redis::user::remove

    # other
    include redis::slaveof  # todo

##### Depends on

     include repo_eden_rpm

### itens created

    /etc/redis.conf
    /etc/init.d/redis
    /etc/logorate.d/redis


# vim:ft=markdown

