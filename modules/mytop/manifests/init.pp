
class mytop {

  include motd
  motd::register{ $module_name : }

  # Default
  include mytop::install

} # class

# vim:ft=puppet:

