
class tools_sys::install {

  # Load variables defined in params.pp file.
  require tools_sys::params

  # Register
# motd::register{ "tools_sys" : }

  # Installing all itens from array
  package { $tools_sys::params::whitelist: ensure => present }
  package { $tools_sys::params::blacklist: ensure => present }

}

# vim:ft=puppet:

