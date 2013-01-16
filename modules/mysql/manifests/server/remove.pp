
class mysql::server::remove {

  require mysql::params

  package { 'mysql-server':
    ensure  => absent,
    name    => $mysql::params::pkg_name_server,
    require => File['my.cnf']
  }

  file { 'my.cnf':
    ensure  => absent,
    path    => $mysql::params::config_file,
    require => Service['mysql'],
  }

  service { 'mysql':
    ensure => stopped,
    name   => $mysql::params::service_name,
    enable => false,
  }

  ###
  ### just in case....
  ###
  file { 'rpm_upgrade_marker':
    ensure  => absent,
    path    => '/var/lib/mysql/RPM_UPGRADE_MARKER',
  }

}

# vim:ft=puppet:

