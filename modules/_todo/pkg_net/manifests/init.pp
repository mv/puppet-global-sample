
class tools_net {

  # Load variables defined in params.pp file.
  require tools_net::params

  # Default action: install
  include tools_net::install

}

# vim:ft=puppet:

