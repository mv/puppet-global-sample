class php::ldap::remove {

  ### reuse 'package' definition
  require php::install

  package { 'php-ldap':
    ensure  => absent,
    require => Package['php'],
    notify  => Service['httpd'],
  }

} # class

# vim:ft=puppet:


