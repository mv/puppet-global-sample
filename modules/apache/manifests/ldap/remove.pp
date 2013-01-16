class apache::ldap::remove {

  require apache::params

  ### reuse 'service' definition
  include apache::install

  file {'/etc/httpd/conf/httpd-ldap.conf':
    ensure => absent,
    notify => Service['httpd'],
  }

} # class

# vim:ft=puppet:

