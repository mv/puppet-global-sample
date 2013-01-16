
class php::params {

  case $::operatingsystem {

    /(RedHat|CentOS)/ : {

      $pkg_name         = 'php'
      $pkg_dependencies = ['php-common','php-cli']
      $depend_on_pkg    = 'php-gd'

      $config_dir       = '/etc'
      $config_file      = "${config_dir}/php.ini"

      $init_config_dir  = "${config_dir}/httpd/conf.d"
      $init_config_file = "${init_config_dir}/php.conf"

    }

    /(Debian|Ubuntu)/ : {

      $pkg_name         = 'php'
# ?   $pkg_dependencies = [''],
# ?   $depend_on_pkg    = ''

      $config_dir       = '/etc'
      $config_file      = "${config_dir}/php.ini"

      $init_config_dir  = "${config_dir}/apache2/mods-available"
      $init_config_file = "${init_config_dir}/php.conf"

    }

    default : {
      notice("Unsupported operating system: ${::operatingsystem}")
    }

  } # case

} # class

# vim:ft=puppet:

