
class nginx::params {


  case $::operatingsystem {

    /(RedHat|CentOS)/ : {

      $pkg_name    = 'nginx'
      $config_dir  = '/etc/sysconfig'
      $config_file = "${config_dir}/${pkg_name}"

      $init_file   = "/etc/init.d/${pkg_name}"
      $rotate_cfg  = "/etc/logrotate.d/${pkg_name}"
      $monit_cfg   = "/etc/monit.d/${pkg_name}.monit.conf"

      $conf_dir  = '/etc/nginx'
      $conf_file = "${conf_dir}/${pkg_name}.conf"

      $service_name = $pkg_name
      $service_port = 80

      $process_name = $pkg_name
      $pid_file     = "/var/run/${pkg_name}.pid"
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

