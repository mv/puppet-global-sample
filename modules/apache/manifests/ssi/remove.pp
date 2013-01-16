class apache::ssi::remove {

  require apache::params

  ### reuse 'service' definition
  include apache::install

  file {'/etc/httpd/conf/httpd-ssi.conf':
    ensure => absent,
    notify => Service['httpd'],
  }

} # class

# vim:ft=puppet:

