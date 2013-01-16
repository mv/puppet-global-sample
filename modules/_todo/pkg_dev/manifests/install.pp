
class tools_dev::install {

  # Load variables defined in params.pp file.
  require tools_dev::params

  # Register
# motd::register{ "tools_dev" : }

  # Installing all itens from array
  package { $tools_dev::params::blacklist: ensure => present }
  package { $tools_dev::params::whitelist: ensure => present }

}

# vim:ft=puppet:

