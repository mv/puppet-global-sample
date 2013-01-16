
class tools_net::install {

  # Load variables defined in params.pp file.
  require tools_net::params

  # Register
# motd::register{ "tools_net" : }

  # Installing all itens from array
  package { $tools_net::params::whitelist: ensure => present }
  package { $tools_net::params::blacklist: ensure => present }

}

# vim:ft=puppet:

