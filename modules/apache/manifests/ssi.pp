class apache::ssi {

  require apache::params

  ### reuse 'service' definition
  include apache::install

  file {'/etc/httpd/conf/httpd-ssi.conf':
    ensure => present,
    source => 'puppet:///modules/apache/conf/httpd-ssi.conf',
    notify => Service['httpd'],
  }

} # class

# vim:ft=puppet:

