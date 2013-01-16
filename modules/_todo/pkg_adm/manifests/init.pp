
class tools_adm {

  # Load variables defined in params.pp file.
  require tools_adm::params

  # Default action: install
  include tools_adm::install

}

# vim:ft=puppet:

