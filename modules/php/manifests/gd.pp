class php::gd {

  require repo_remi

  ### reuse 'package' definition
  require php::install

  package { 'php-gd':
    ensure  => present,
    require => Package['php'],
    notify  => Service['httpd'],
  }


} # class

# vim:ft=puppet:

