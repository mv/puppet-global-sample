
class git::params {


  case $::operatingsystem {

    /(RedHat|CentOS)/ : {

      $pkg_name   = 'git'
      $depends_on = [ 'perl-Git', 'perl-TermReadKey' ]

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

