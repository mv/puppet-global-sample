
class tools_net::remove::all {

  # Load variables defined in params.pp file.
  require tools_net::params

  # call on array list
  common::uninstall_force { $tools_net::params::whitelist : }
  common::uninstall_force { $tools_net::params::blacklist : }

}

# vim:ft=puppet:

