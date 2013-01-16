
class apache {

  include motd
  motd::register{ $module_name : }

  # Parameters by operating system
  require apache::params

  # Default: only install client
  include apache::install

} # class

# vim:ft=puppet:

