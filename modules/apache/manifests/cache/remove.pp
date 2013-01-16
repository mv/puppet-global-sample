class apache::cache::remove {

# require apache::params

  ### reuse 'service' definition
  include apache::install

  file {'/etc/httpd/conf/httpd-cache.conf':
    ensure => absent,
    notify => Service['httpd'],
  }

} # class

# vim:ft=puppet:

