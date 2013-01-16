# Puppet: mongo


### Usage

##### MongoDB client

    # install
    include mongo
    include mongo::client
    include mongo::client::install

    # remove
    include mongo::client::remove

##### MongoDB server

    # install
    include mongo::server
    include mongo::server::install

    include mongo::configsrv
    include mongo::configsrv::install

    # remove
    include mongo::server::remove

    # itens created
    /etc/mongod.conf
    /etc/init.d/mongod
    /etc/sysconfig/mongod
    /mongo/
    /mongo/logs/
    /mongo/arch/

