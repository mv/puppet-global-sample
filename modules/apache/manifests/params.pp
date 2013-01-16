
class apache::params {

  case $::operatingsystem {

    /(RedHat|CentOS)/ : {

      $pkg_name         = 'httpd'
      $pkg_dependencies = ['apr', 'apr-util']
      $depend_on_pkg    = 'mod_ssl'

      $user_name        = 'apache'
      $group_name       = 'apache'

      $config_dir       = '/etc/httpd'
      $config_extra_dir = "${config_dir}/conf"
      $vhost_dir        = "${config_dir}/conf.d"

      $config_file      = "${config_dir}/httpd.conf"
      $init_config_file = '/etc/sysconfig/httpd'

      $service_name     = 'httpd'
      $process_name     = 'httpd'
      $pid_file         = '/var/run/httpd.pid'
      $has_status       = true
      $has_restart      = true

    }

    /(Debian|Ubuntu)/ : {

      $pkg_name         = 'apache2'
# ?   $pkg_dependencies = ''
# ?   $depend_on_pkg    = ''

      $user_name        = 'apache2'
      $group_name       = 'apache2'

      $config_dir       = '/etc/apache2'
      $config_extra_dir = "${config_dir}/conf"
      $vhost_dir        = "${config_dir}/sites-available"

      $config_file      = "${config_dir}/httpd.conf"
      $init_config_file = '/etc/default/apache2'

      $service_name     = 'apache2'
      $process_name     = 'apache2'
# ?   $pid_file         = '/var/run/httpd.pid'
      $has_status       = true
      $has_restart      = true

    }

    default : {
      notice("Unsupported operating system: ${::operatingsystem}")
    }

  } # case

} # class

# vim:ft=puppet:

