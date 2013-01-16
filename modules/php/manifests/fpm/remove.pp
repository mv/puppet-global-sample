class php::fpm::remove {

  ### reuse 'package' definition
  require php::install

  package { 'php-fpm':
    ensure  => absent,
    require => Package['php'],
    notify  => Service['httpd'],
  }


} # class

# vim:ft=puppet:


