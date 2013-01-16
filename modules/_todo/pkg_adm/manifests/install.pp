
class tools_adm::install {

  # Load variables defined in params.pp file.
  require tools_adm::params

  # Register
# motd::register{ "tools_adm" : }

  # Installing all itens from array
  package { $tools_adm::params::whitelist: ensure => present }
  package { $tools_adm::params::blacklist: ensure => present }

}

# vim:ft=puppet:

