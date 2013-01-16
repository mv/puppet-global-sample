# Puppet: foo


### Usage

##### foo-client

    # install
    include foo
    include foo::client
    include foo::client::install
    
    # remove
    include foo::client::remove

##### foo-server

    # install
    include foo::server
    include foo::server::install
    
    # remove
    include foo::server::remove
    
    # itens created
    /etc/foo.cnf
    /etc/init.d/foo
