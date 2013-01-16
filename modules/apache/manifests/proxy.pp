class apache::proxy {

# require apache::params

  ### reuse 'service' definition
  include apache::install

  file {'/etc/httpd/conf/httpd-proxy.conf':
    ensure => present,
    source => 'puppet:///modules/apache/conf/httpd-proxy.conf',
    notify => Service['httpd'],
  }

} # class

# vim:ft=puppet:

