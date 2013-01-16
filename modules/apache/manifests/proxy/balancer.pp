class apache::proxy::balancer {

# require apache::params

  ### reuse 'service' definition
  include apache::install

  file {'/etc/httpd/conf/httpd-proxy-balancer.conf':
    ensure => present,
    source => 'puppet:///modules/apache/httpd-proxy-balancer.conf',
    notify => Service['httpd'],
  }

} # class

# vim:ft=puppet:

