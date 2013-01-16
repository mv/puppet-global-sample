
class mysql::client::remove {

  require mysql::params

  package { 'mysql-client':
    ensure  => absent,
    name    => $mysql::params::pkg_name_client,
    require => Package['depend-on-client'],
  }

  package { 'depend-on-client':
    ensure => absent,
    name   => $mysql::params::depend_on_client,
  }

}

# vim:ft=puppet:

