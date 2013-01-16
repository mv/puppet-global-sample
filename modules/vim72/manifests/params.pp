
class vim72::params {

  case $::operatingsystem {

    /(RedHat|CentOS)/ : {
      $pkg_name    = 'vim-enhanced'
      $config_file = '/etc/vimrc'
      $depends_on  = [ 'vim-common', 'gpm-libs' ]

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

