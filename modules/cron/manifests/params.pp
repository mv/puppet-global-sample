
class cron::params {


  case $::operatingsystem {

    /(RedHat|CentOS)/ : {

      $pkg_name    = 'cronie'
      $config_dir  = '/etc/sysconfig'
      $config_file = "${config_dir}/crond"

      $init_file   = '/etc/init.d/crond'
      $crontab     = '/etc/crontab'

      $service_name = 'crond'
      $process_name = 'crond'
      $pid_file     = '/var/run/crond.pid'
      $has_status   = true

    }

#   /(Debian|Ubuntu)/ : {
#
#   }

    default : {
      notice("Unsupported operating system: ${::operatingsystem}")
    }

  } # case

} # class

# vim:ft=puppet:

