class php::remove {

  require php::params

  # notify 'service'
  include apache::install

  package { 'php':
    ensure => absent,
    name   => $php::params::pkg_name,
  }

  package { $php::params::pkg_dependencies :
    ensure    => absent,
    subscribe => Package['php'],
  }

  File { notify  => Service['httpd'], }

  ###
  ### Conf
  ###
  file {'/var/lib/php/session':         ensure => absent, force => true }
  file {'/var/www/php-info':            ensure => absent, force => true }

  file {$php::params::init_config_file: ensure => absent, }
  file {$php::params::config_file     : ensure => absent, }

  file {'php-info.conf': ensure => absent, path => "${php::params::init_config_dir}/php-info.conf", }
  file {'php-info.php':  ensure => absent, path => '/var/www/php-info/index.php', }

} # class

# vim:ft=puppet:

