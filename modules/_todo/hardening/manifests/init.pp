
class hardening {

  include motd
  motd::register{ $module_name : }

  # Parameters by operating system
  require hardening::params

  # Default: only install client
  include hardening::install

} # class

# hardening:ft=puppet:

