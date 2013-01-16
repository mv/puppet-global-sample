
class tools_sys {

  # Load variables defined in params.pp file.
  require tools_sys::params

  # Default action: install
  include tools_sys::install

}

# vim:ft=puppet:

