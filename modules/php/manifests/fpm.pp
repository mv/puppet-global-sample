class php::fpm {

  require repo_remi

  ### reuse 'package' definition
  require php::install

  package { 'php-fpm':
    ensure  => present,
    require => Package['php'],
    notify  => Service['httpd'],
  }


} # class

# vim:ft=puppet:

