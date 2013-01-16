
class java::params {

  case $::operatingsystem {

    /(RedHat|CentOS)/ : {

      $jre_name = 'jre-1.6.0_35-fcs.x86_64'
      $jdk_name = 'jdk-1.6.0_35-fcs.x86_64'

    }

#   /(Debian|Ubuntu)/ : {
#
#     $jre_name = 'jre-1.6.0_35-fcs.x86_64'
#     $jdk_name = 'jdk-1.6.0_35-fcs.x86_64'
#
#   }

    default : {
      notice("Unsupported operating system: ${::operatingsystem}")
    }

  } # case

} # class

# vim:ft=puppet:

