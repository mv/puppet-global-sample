class php::mysql::remove {

  ### reuse 'service' definition
  include php::install

  package { 'php-mysql':
    ensure  => absent,
    require => Package['php'],
    notify  => Service['httpd'],
  }

} # class

# vim:ft=puppet:

