
class tools_adm::remove::all {

  # Load variables defined in params.pp file.
  require tools_adm::params

  # call on array list
  common::uninstall_force { $tools_adm::params::blacklist : }
  common::uninstall_force { $tools_adm::params::whitelist : }

}

# vim:ft=puppet:

