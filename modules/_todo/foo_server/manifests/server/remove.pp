
class foo_server::server::remove {

  require foo_server::params

  package { 'foo-server':
    ensure  => absent,
    name    => $foo_server::params::pkg_name_server,
    require => File['my.cnf']
  }

  file { 'my.cnf':
    ensure  => absent,
    path    => $foo_server::params::config_file,
    require => Service['foo'],
  }

  service { 'foo':
    ensure => stopped,
    name   => $foo_server::params::service_name,
    enable => false,
  }

  ###
  ### just in case....
  ###
  file { 'rpm_upgrade_marker':
    ensure  => absent,
    path    => '/var/lib/foo/RPM_UPGRADE_MARKER',
  }

}

# vim:ft=puppet:

