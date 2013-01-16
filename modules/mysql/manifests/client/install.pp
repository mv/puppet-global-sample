
class mysql::client::install {

# include motd
# motd::register{ $module_name : }

  require mysql::params

  package { 'mysql-client':
    ensure => installed,
    name   => $mysql::params::pkg_name_client,
  }

}

# vim:ft=puppet:

