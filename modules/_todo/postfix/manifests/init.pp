
class postfix {

  include motd
  motd::register{ $module_name : }

  # Load variables defined in params.pp file.
  require postfix::params

  # Default action: execute install
  include postfix::install

}

# vim:ft=puppet:

