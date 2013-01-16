
class php {

  include motd
  motd::register{ $module_name : }

  # Parameters by operating system
  require php::params

  # Default: only install client
  include php::install

} # class

# vim:ft=puppet:

