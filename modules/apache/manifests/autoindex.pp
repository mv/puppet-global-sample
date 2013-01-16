class apache::autoindex {

# require repo_abril

  require apache::params

  ### reuse 'service' definition
  include apache::install

  file {'/etc/httpd/conf/httpd-autoindex.conf':
    ensure => present,
    source => 'puppet:///modules/apache/conf/httpd-autoindex.conf',
    notify => Service['httpd'],
  }

} # class

# vim:ft=puppet:

