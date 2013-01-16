# Puppet: Nginx


Nginx web server

This module depends on repo_eden_rpm.


### References

  * http://nginx.org/en/download.html
  * http://nginx.org/packages/rhel/6/
  * http://nginx.org/packages/rhel/6/SRPMS/
  * http://nginx.org/packages/rhel/6/x86_64/

### Usage

##### nginx

    # install
    include nginx
    include nginx::install

    # remove
    include nginx::remove

    # user
    include nginx::user
    include nginx::user::remove

### itens created

    /etc/init.d/nginx
    /etc/logrotate.d/nginx
    /etc/sysconfig/nginx
    /etc/nginx
    /etc/nginx/conf
    /etc/nginx/conf.d
    User:  nginx
    Group: nginx


# vim:ft=markdown

