
class mongo::server::remove {

  require mongo::params

  package { 'mongo-server':
    ensure  => absent,
    name    => $mongo::params::pkg_name_server,
    require => File['my.cnf']
  }

  file { 'my.cnf':
    ensure  => absent,
    path    => $mongo::params::config_file,
    require => Service['mongo'],
  }

  service { 'mongod':
    ensure => stopped,
    name   => $mongo::params::service_name,
    enable => false,
  }

  ###
  ### just in case....
  ###
  file { 'rpm_upgrade_marker':
    ensure  => absent,
    path    => '/var/lib/mongo/RPM_UPGRADE_MARKER',
  }

}

# vim:ft=puppet:

