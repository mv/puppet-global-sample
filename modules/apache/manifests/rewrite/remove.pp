class apache::rewrite::remove {

  require apache::params

  ### reuse 'service' definition
  include apache::install

  file {'/etc/httpd/conf/httpd-rewrite.conf':
    ensure => absent,
    notify => Service['httpd'],
  }

} # class

# vim:ft=puppet:

