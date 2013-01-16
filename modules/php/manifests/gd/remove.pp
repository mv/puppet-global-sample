class php::gd::remove {

  ### reuse 'package' definition
  require php::install

  package { 'php-gd':
    ensure  => absent,
    require => Package['php'],
    notify  => Service['httpd'],
  }

} # class

# vim:ft=puppet:

