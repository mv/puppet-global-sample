
class foo_server::client::install {

  require foo_server::params

# require repo_abril

  package { 'foo-client':
    ensure => installed,
    name   => $foo_server::params::pkg_name_client,
  }

}

# vim:ft=puppet:

