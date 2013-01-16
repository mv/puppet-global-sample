class memcached::install {

  include motd
  motd::register{ $module_name : }

# require repo_epel
  require memcached::params

  package { 'memcached':
    ensure => installed,
    name   => $memcached::params::pkg_name,
  }

  user { 'memcached':
	ensure  => present,
	name    => $memcached::params::user_name,
	require => Package['memcached']
  }

  file { 'sysconfig-memcached':
	ensure  => present,
	name    => $memcached::params::sysconfig_memcached_file_path,
	require => Package['memcached']
  }

  service { 'memcached':
    ensure  => running,
    name    => $memcached::params::service_name,
    enable  => true,
    require => [ Package['memcached'], User['memcached'], File['sysconfig-memcached'] ],
  }

}
