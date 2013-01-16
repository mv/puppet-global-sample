
class tools_sys::remove {

  # Load variables defined in params.pp file.
  require tools_sys::params

  # call on array list
  common::uninstall_force { $tools_sys::params::blacklist : }

}

# vim:ft=puppet:

