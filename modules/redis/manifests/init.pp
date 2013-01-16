
class redis {

  include motd
  motd::register{ $module_name : }

  # Default
  include redis::install

} # class

# vim:ft=puppet:

