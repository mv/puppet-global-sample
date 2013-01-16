
class icinga {

  include motd
  motd::register{ $module_name : }

  # Parameters by operating system
  require icinga::params

  # Default: only install client
  include icinga::install

} # class

# vim:ft=puppet:

