
class tools_dev::remove {

  # Load variables defined in params.pp file.
  require tools_dev::params

  # call on array list
  common::uninstall_force { $tools_dev::params::blacklist : }

}

# vim:ft=puppet:

