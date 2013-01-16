
class icinga::params {

# icinga
#   +- libtool-ltdl
#
# icinga-gui
#   +- icinga
#   +- icinga-doc
#   +- httpd
#   +- gd
#
# icinga-api
#   +- httpd
#   +- php
#   +- php-cli
#   +- php-common
#
# icinga-idoutils
#   +- icinga
#   +- libdbi


  ###
  ### Specifics
  ###
  case $::operatingsystem {

    /(RedHat|CentOS)/ : {

      $pkg_name         = 'icinga'
      $pkg_dependencies = ['libtool-ltdl']
      $depend_on_me     = 'icinga-idoutils'

      $pkg_gui              = 'icinga-gui'
      $pkg_gui_dependencies = ['icinga-doc']

      $pkg_api = 'icinga-api'
      $pkg_ido = 'icinga-idoutils'

      $config_dir  = '/etc/icinga'
      $config_file   = "${config_dir}/icinga.cfg"
      $resource_file = "${config_dir}/resource.cfg"

      $service_name = 'icinga'
      $process_name = 'icinga'
      $pid_file     = '/var/icinga/icinga.pid'
      $has_status   = true

    }

    /(Debian|Ubuntu)/ : {

      $pkg_name         = 'icinga'
# ?   $pkg_dependencies = [''],
# ?   $depend_on_pkg    = ''

      $config_dir  = '/etc/icinga'
      $config_file = "${config_dir}/icinga.cfg"

    }

    default : {
      notice("Unsupported operating system: ${::operatingsystem}")
    }

  } # case

} # class

# vim:ft=puppet:

