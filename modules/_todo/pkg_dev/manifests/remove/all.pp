
class tools_dev::remove::all {

  # Load variables defined in params.pp file.
  require tools_dev::params

  # call on array list
  common::uninstall_force { $tools_dev::params::blacklist : }
  common::uninstall_force { $tools_dev::params::whitelist : }

}

# vim:ft=puppet:

