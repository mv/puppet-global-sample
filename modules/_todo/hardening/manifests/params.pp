
class hardening::params {

  case $::operatingsystem {

    /(RedHat|CentOS)/ : {
      $pkg_name         = 'hardening'
      $pkg_dependencies = ''

#     $pkg_name         = 'hardening-enhanced'
#     $pkg_dependencies = ['gpm', 'hardening-common']
#     $depend_on_pkg    = ''

      $config_file      = '/etc/hardening.conf'
    }

    /(Debian|Ubuntu)/ : {
      $pkg_name         = ''
      $pkg_dependencies = ''
      $depend_on_pkg    = ''

      $config_file      = ''
    }

    default : {
      $pkg_name         = ''
      $pkg_dependencies = ''
      $depend_on_pkg    = ''

      $config_file      = ''
    }

  } # case

} # class

# hardening:ft=puppet:

