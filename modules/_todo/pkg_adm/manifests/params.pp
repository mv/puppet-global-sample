
class tools_adm::params  {

  ###
  ### whitelist: ok to keep
  ### blacklist: will be removide in prod
  ###

  case $::operatingsystem {

    /(RedHat|CentOS)/ : {

      $whitelist = [  # {
        'dstat',
        'sysstat',
        'htop',
        'dtach',
        'screen',
        'logwatch',
        'tmpwatch',
        'dmidecode',
        'virt-what',
        'createrepo',
        'gnupg',
#       'keyutils',
      ] # }

      $blacklist = [  # {
        'at',
        'usermode',
        'groff',
        'man',
        'man-pages',
        'man-overrides',
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

