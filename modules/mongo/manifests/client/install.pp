
class mongo::client::install {

# include motd
# motd::register{ $module_name : }

# require yum_10gen

  require mongo::params

  package { 'mongo-client':
    ensure => installed,
    name   => $mongo::params::pkg_name_client,
  }

}

# vim:ft=puppet:

