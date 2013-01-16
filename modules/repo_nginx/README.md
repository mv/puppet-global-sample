# Puppet: repo_nginx

Nginx rpm packages


### References

  * http://nginx.org/en/download.html
  * http://nginx.org/packages/rhel/6/
  * http://nginx.org/packages/rhel/6/noarch/RPMS/nginx-release-rhel-6-0.el6.ngx.noarch.rpm

### Usage

    # install
    include repo_nginx
    include repo_nginx::install

    # remove
    include repo_nginx::remove

    # others
    include repo_nginx::enable
    include repo_nginx::disable


# vim:ft=markdown:

