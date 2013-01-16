
class foo::params {

  case $::operatingsystem {

    /(RedHat|CentOS)/ : {
      $pkg_name         = 'foo'
      $pkg_dependencies = ''

#     $pkg_name         = 'foo-enhanced'
#     $pkg_dependencies = ['gpm', 'foo-common']
#     $depend_on_pkg    = ''

      $config_file      = '/etc/foo.conf'
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

# foo:ft=puppet:

