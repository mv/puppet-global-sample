class php::dba {

  require repo_remi

  ### reuse 'package' definition
  require php::install

  package { 'php-dba':
    ensure  => present,
    require => Package['php'],
    notify  => Service['httpd'],
  }


} # class

# vim:ft=puppet:

