
class postfix::params  {

  ###
  ### All operatingsystems
  ###
  $protocol = 'tcp'
  $port     = 25

  ###
  ### Specifics
  ###
  case $::operatingsystem {

    /(RedHat|CentOS)/ : {
      $pkg_name         = 'postfix'
#     $pkg_dependencies = 'cyrus-sasl'
#     $depend_on_pkg    = ''

      $config_dir       = '/etc/postfix'
      $config_file      = 'main.cf'
#     $init_config_file = '/etc/sysconfig/postfix'

      $service_name     = 'postfix'
      $process_name     = 'master'
      $pid_file         = '/var/spool/postfix/pid/master.pid'
      $has_status       = true
    }

    /(Debian|Ubuntu)/ : {
      $pkg_name         = 'postfix'
#     $pkg_dependencies = 'cyrus-sasl'
#     $depend_on_pkg    = ''

      $config_dir       = '/etc/postfix'
      $config_file      = 'main.cf'
      $init_config_file = '/etc/default/postfix'

      $service_name     = 'postfix'
      $process_name     = 'master'
      $pid_file         = '/var/run/postfix.pid'
      $has_status       = false
    }

    default : {
      $pkg_name         = 'postfix'
#     $pkg_dependencies = 'cyrus-sasl'
#     $depend_on_pkg    = ''

      $config_dir       = '/etc/postfix'
      $config_file      = 'main.cf'
#     $init_config_file = '/etc/sysconfig/postfix'

      $service_name     = 'postfix'
      $process_name     = 'master'
      $pid_file         = '/var/run/postfix.pid'
      $has_status       = false
    }

  } # case

  # notice("Params: ${::operatingsystem}")
  # notice("Params: ${pkg_name}")

} # class


# vim:ft=puppet:

