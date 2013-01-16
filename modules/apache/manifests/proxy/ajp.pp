class apache::proxy::ajp {

# require apache::params

  ### reuse 'service' definition
  include apache::install

  file {'/etc/httpd/conf/httpd-proxy-ajp.conf':
    ensure => present,
    source => 'puppet:///modules/apache/httpd-proxy-ajp.conf',
    notify => Service['httpd'],
  }

} # class

# vim:ft=puppet:

