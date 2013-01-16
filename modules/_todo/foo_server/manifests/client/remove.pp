
class foo_server::client::remove {

  require foo_server::params

  package { 'foo-client':
    ensure  => absent,
    name    => $foo_server::params::pkg_name_client,
    require => Package['depend-on-client'],
  }

  package { 'depend-on-client':
    ensure => absent,
    name   => $foo_server::params::depend_on_client,
  }

}

# vim:ft=puppet:

