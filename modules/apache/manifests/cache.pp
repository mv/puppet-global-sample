class apache::cache {

# require apache::params

  ### reuse 'service' definition
  include apache::install

  file {'/etc/httpd/conf/httpd-cache.conf':
    ensure => present,
    source => 'puppet:///modules/apache/httpd-cache.conf',
    notify => Service['httpd'],
  }

  file {'/var/tmp/cacheroot':
    ensure => directory,
  }

} # class

# vim:ft=puppet:

