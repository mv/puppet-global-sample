
class redis::params {


  case $::operatingsystem {

    /(RedHat|CentOS)/ : {

      $pkg_name    = 'redis'
      $config_dir  = '/etc'
      $config_file = '/etc/redis.conf'

      $init_file   = "/etc/init.d/${pkg_name}"
      $rotate_cfg  = "/etc/logrotate.d/${pkg_name}"

      $service_name = $pkg_name
      $service_port = 6379
      $protocol     = 'tcp'

      $process_name = $pkg_name
      $pid_file     = "/var/run/${pkg_name}/${pkg_name}.pid"
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

