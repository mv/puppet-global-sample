# Puppet: icinga


### Usage

##### icinga

    # install
    include icinga
    include icinga::install

    # remove
    include icinga::remove

##### Extra modules

    include icinga::user
    include icinga::user::remove
    include icinga::gui
    include icinga::gui::remove
    include icinga::ido
    include icinga::ido::remove
    include icinga::api
    include icinga::api::remove

### itens created

    /etc/init.d/icinga
    /etc/icinga/
    /etc/icinga/icinga.cfg
    /etc/icinga/resource.cfg
    /etc/icinga/modules/
    /etc/icinga/objects/
    /var/icinga/
    /var/log/icinga/


