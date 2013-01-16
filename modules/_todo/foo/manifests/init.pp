
class foo {

  include motd
  motd::register{ $module_name : }

  # Parameters by operating system
  require foo::params

  # Default: only install client
  include foo::install

} # class

# foo:ft=puppet:

