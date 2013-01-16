
class tools_dev {

  # Load variables defined in params.pp file.
  require tools_dev::params

  # Default action: install
  include tools_dev::install

}

# vim:ft=puppet:

