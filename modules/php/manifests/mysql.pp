class php::mysql {

  require repo_remi

  ### reuse 'package' definition
  require php::install

  package { 'php-mysql':
    ensure  => present,
    require => Package['php'],
    notify  => Service['httpd'],
  }

} # class

# vim:ft=puppet:

