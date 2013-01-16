class php::install {

# require repo_abril
  require repo_remi

  require php::params

  # notify 'service'
  include apache::install

  package { 'php':
    ensure  => installed,
    name    => $php::params::pkg_name,
  }

  package { $php::params::pkg_dependencies :
    ensure  => installed,
  }

  File {
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Service['httpd'],
  }

  ###
  ### Directories
  ###
  file {'/var/lib/php/session':
    ensure => directory ,
    owner  => 'root',
    group  => 'apache',
    mode   => '0770',
  }

  file {'/var/www/php-info':
    ensure => directory ,
    owner  => 'root',
    group  => 'apache',
    mode   => '0770',
  }

  ###
  ### Conf
  ###
  file { $php::params::init_config_file :
    ensure => present,
    source => 'puppet:///modules/php/php.conf',
  }

  file { $php::params::config_file :
    ensure => present,
    source => 'puppet:///modules/php/php.ini',
  }

  file { 'php-info.php':
    ensure  => present,
    path    => '/var/www/php-info/index.php',
    source  => 'puppet:///modules/php/php-info.php',
    require => File['/var/www/php-info']
  }

  file { 'php-info.conf':
    ensure => present,
    path   => "${php::params::init_config_dir}/php-info.conf",
    source => 'puppet:///modules/php/php-info.conf',
  }

} # class

# vim:ft=puppet:

