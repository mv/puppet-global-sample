# Puppet: apache


### Usage

##### apache

    # install
    include apache
    include apache::install

    # remove
    include apache::remove

    # config/tuning
    class { 'apache::tuning':
        p_Timeout              => '300',
        ### 'KeepAlive'
        p_KeepAlive            => 'On' ,
        p_MaxKeepAliveRequests => '100',
        p_KeepAliveTimeout     => '5',
        ### prefork
        p_ServerLimit          => '2048',
        p_MaxClients           => '1024',
        p_MaxRequestsPerChild  => '10240',
        p_StartServers         => '5',
        p_MinSpareServers      => '55',
        p_MaxSpareServers      => '100',
    }

    # itens created
    /etc/httpd/httpd.conf
    /etc/httpd/conf/*conf       # modules
    /etc/httpd/conf.d/*conf     # vhosts
    /etc/httpd/mods-available   # link to modules
    /etc/httpd/sites-available  # link to vhosts
    /var/www
    /var/www/htdocs
    /var/www/error
    /var/www/icons
    /var/www/logs               # link to /var/log/httpd


##### Extra modules

    # mod_autoindex
    include apache::autoindex
    include apache::autoindex::remove

    # mod_cache, mode_mem_cache, mode_file_cache
    include apache::cache
    include apache::cache::remove

    # mod_cgi
    # TODO: mod_cgid
    include apache::cgi
    include apache::cgi::remove

    # mod_auth_ldap, mod_ldap
    include apache::ldap
    include apache::ldap::remove

    # mod_proxy + http, balancer, ajp
    include apache::proxy
    include apache::proxy::remove
    include apache::proxy::balancer
    include apache::proxy::balancer::remove
    include apache::proxy::balancer::ajp
    include apache::proxy::balancer::ajp::remove

    # mod_rewrite
    include apache::rewrite
    include apache::rewrite::remove

    # mod_include: SSI: Server Side Includes
    include apache::ssi
    include apache::ssi::remove

    # mod_ssl
    include apache::ssl
    include apache::ssl::remove


