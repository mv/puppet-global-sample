class apache::autoindex::remove {

  require apache::params

  ### reuse 'service' definition
  include apache::install

  file {'/etc/httpd/conf/httpd-autoindex.conf':
    ensure => absent,
    notify => Service['httpd'],
  }

} # class

# vim:ft=puppet:

