# Puppet: mysql


### Usage

##### MySQL-client

    # install
    include mysql
    include mysql::client
    include mysql::client::install
    
    # remove
    include mysql::client::remove

##### MySQL-server

    # install
    include mysql::server
    include mysql::server::install
    
    # remove
    include mysql::server::remove
    
    # itens created
    /etc/my.cnf
    /etc/init.d/mysql
    /mysql/
    /mysql/data/
    /mysql/logs/
    /mysql/arch/
