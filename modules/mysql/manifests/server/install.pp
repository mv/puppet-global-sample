
class mysql::server::install {

# include motd
# motd::register{ $module_name : }

  require mysql::params
  require mysql::client::install

  package { 'mysql-server':
    ensure   => installed,
    name     => $mysql::params::pkg_name_server,
    require  => Package['mysql_server_dependencies'],
  }

  package { 'mysql_server_dependencies':
    ensure => present,
    name   => $mysql::params::server_dependencies,
  }

  file { 'my.cnf':
    ensure  => present,
    path    => $mysql::params::config_file,
    owner   => 'mysql',
    group   => 'mysql',
    mode    => '0644',
    content => template('mysql/my.cnf.erb'),
    require => Package['mysql-server'],
  }

  service { 'mysql':
    ensure  => running,
    name    => $mysql::params::service_name,
    enable  => true,
    pattern => 'mysqld',
    require => [ File['my.cnf'], User['mysql'], Exec['install_db'] ],
  }

  exec { 'install_db':
    command   => 'mysql_install_db',
    creates   => '/mysql/data/mysql/host.frm',
    path      => '/usr/bin:/bin',
    logoutput => on_failure,
    require   => [ Package['mysql-server'], File['/mysql/data'], ],
  }

  user { 'mysql':
    ensure   => present,
    uid      => 27,
    gid      => 27,
    home     => '/var/empty/mysql',
    shell    => '/sbin/nologin',
  # password => '*LK*',
    require  => Group['mysql']
  }

  group { 'mysql':
    ensure => present,
    gid    => 27,
  }

  ###
  ### directories
  ###
  file { ['/mysql',
          '/mysql/data',
          '/mysql/logs',
          '/mysql/binlog',
          ]:
    ensure  => directory,
    owner   => 'mysql',
    group   => 'mysql',
    mode    => '0660',
    recurse => false,
    require => [ User['mysql'], Group['mysql'] ],
  }

  file { '/var/empty/mysql':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  file { '/var/lib/mysql':
    ensure => link,
    target => '/mysql',
    force  => true,
  }

}

# vim:ft=puppet:

