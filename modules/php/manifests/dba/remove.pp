class php::dba::remove {

  ### reuse 'package' definition
  require php::install

  package { 'php-dba':
    ensure  => absent,
    require => Package['php'],
    notify  => Service['httpd'],
  }

} # class

# vim:ft=puppet:

