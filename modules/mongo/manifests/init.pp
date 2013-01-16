
class mongo {

  # Parameters by operating system
  require mongo::params

  # Default: only install client
  include mongo::client::install

}

# vim:ft=puppet:

