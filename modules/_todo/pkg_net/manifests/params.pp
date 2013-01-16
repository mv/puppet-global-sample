
class tools_net::params  {

  ###
  ### whitelist:   can be removed in prod
  ### blacklist: must be kept in prod
  ###

  case $::operatingsystem {

    /(RedHat|CentOS)/ : {

      $whitelist = [  # {
        'bind-utils',
        'curl',
        'ftp',
        'lsof',
        'jwhois',
        'ntp',
        'rdate',
        'rsync',
        'traceroute',
        'wget',
      ] # }

      $blacklist = [  # {
        'nc',
        'nmap',
        'rsh',
        'telnet',
        'tcpdump',
      ] # }
    }

    /(Debian|Ubuntu)/ : {
      $whitelist = ''
      $blacklist = ''
    }

    default : {
      $whitelist = ''
      $blacklist = ''
    }

  } # case

}

# vim:ft=puppet:

