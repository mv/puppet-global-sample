
class foo_server {

  include motd
  motd::register{ $module_name : }

  # Parameters by operating system
  require foo_server::params

  # Default: only install client
  include foo_server::client::install

}

# vim:ft=puppet:

