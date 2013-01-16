
class memcached::remove {

  require memcached::params

  package { 'memcached':
    ensure  => absent,
    name    => $memcached::params::pkg_name,
  }

  service { 'memcached':
    ensure => stopped,
    name   => $memcached::params::service_name,
    enable => false,
  }

  user { 'memcached':
	ensure  => absent,
	name    => $memcached::params::user_name,
  }

}

# vim:ft=puppet:

