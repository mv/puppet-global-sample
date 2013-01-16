
class mysql {

  # Parameters by operating system
  require mysql::params

  # Default: only install client
  include mysql::client::install

}

# vim:ft=puppet:

