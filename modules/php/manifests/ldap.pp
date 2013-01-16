class php::ldap {

  require repo_remi

  ### reuse 'package' definition
  require php::install

  package { 'php-ldap':
    ensure  => present,
    require => Package['php'],
    notify  => Service['httpd'],
  }


} # class

# vim:ft=puppet:

