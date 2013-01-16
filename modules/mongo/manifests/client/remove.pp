
class mongo::client::remove {

  require mongo::params

  package { 'mongo-client':
    ensure  => absent,
    name    => $mongo::params::pkg_name_client,
    require => Package['depend-on-client'],
  }

}

# vim:ft=puppet:

