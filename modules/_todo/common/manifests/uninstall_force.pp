
define common::uninstall_force() {

  case $::operatingsystem {

    /(RedHat|CentOS)/ : {

      exec { "rm_force_${name}":
        command   => "rpm -ev --nodeps --allmatches ${name}",
        path      => '/bin:/usr/bin',
        onlyif    => "rpm -ql ${name}",
        logoutput => on_failure,
      }

    }

    /(Debian|Ubuntu)/ : {

      notice('uninstall_force NOT defined for .deb')

    }

    default : {

      notice("uninstall_force NOT defined for ${::operatingsystem}")

    }

  } # case

}

# vim:ft=puppet:

