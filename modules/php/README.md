# Puppet: php


### Usage

##### php

    # install
    include php
    include php::install

    # remove
    include php::remove

    # itens created
    /etc/php.ini
    /etc/httpd/conf.d/php.conf
    /etc/httpd/conf.d/php-info.conf
    /var/lib/php/session/
    /var/www/php-info/


##### Extra modules

    include php::gd
    include php::gd::remove

    include php::fpm
    include php::fpm::remove

    include php::dba
    include php::dba::remove

    include php::ldap
    include php::ldap::remove

    include php::mysql
    include php::mysql::remove

    TODO: php
    php-pdo
    php-readline
    php-pgsql
    php-snmp
    rrdtool-php

