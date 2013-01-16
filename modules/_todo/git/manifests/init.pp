
class git {

  include motd
  motd::register{ $module_name : }

  # Default
  include git::install

} # class

# vim:ft=puppet:

