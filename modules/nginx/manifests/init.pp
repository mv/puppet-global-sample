
class nginx {

  include motd
  motd::register{ $module_name : }

  # Parameters by operating system
  require nginx::params

  # Default
  include nginx::install

} # class

# vim:ft=puppet:

