class apache::proxy::balancer::remove {

# require apache::params

  ### reuse 'service' definition
  include apache::install

  file {'/etc/httpd/conf/httpd-proxy-balancer.conf':
    ensure  => absent,
    notify  => Service['httpd'],
  }

} # class

# vim:ft=puppet:

