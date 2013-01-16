
class mytop::params {


  case $::operatingsystem {

    /(RedHat|CentOS)/ : {

      $pkg_name   = 'mytop'
      $depends_on = [ 'perl-DBI', 'perl-TermReadKey' ]

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

