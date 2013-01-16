
class tools_adm::remove {

  # Load variables defined in params.pp file.
  require tools_adm::params

  # call on array list
  common::uninstall_force { $tools_adm::params::blacklist : }

}

# vim:ft=puppet:

