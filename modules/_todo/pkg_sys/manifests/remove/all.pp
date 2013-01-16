
class tools_sys::remove::all {

  # Load variables defined in params.pp file.
  require tools_sys::params

  # call on array list
  common::uninstall_force { $tools_sys::params::blacklist : }
  common::uninstall_force { $tools_sys::params::whitelist : }

}

# vim:ft=puppet:

