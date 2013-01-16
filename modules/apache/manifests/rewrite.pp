class apache::rewrite {

  require apache::params

  ### reuse 'service' definition
  include apache::install

  file {'/etc/httpd/conf/httpd-rewrite.conf':
    ensure => present,
    source => 'puppet:///modules/apache/conf/httpd-rewrite.conf',
    notify => Service['httpd'],
  }

} # class

# vim:ft=puppet:

