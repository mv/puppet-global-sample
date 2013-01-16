
class cron {

  include motd
  motd::register{ $module_name : }

  # Default
  include cron::install

} # class

# vim:ft=puppet:

