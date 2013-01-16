
class tools_sys::params  {

  ###
  ### whitelist: ok to keep
  ### blacklist: will be removide in prod
  ###

  case $::operatingsystem {

    /(RedHat|CentOS)/ : {

      $whitelist = [  # {
        'bc',
        'dos2unix',
        'unix2dos',
        'file',
        'less',
        'logrotate',
        'mailx',
        'perl',
        'readline',
        'time',
        'tree',
        'which',
        'bzip2',
        'gzip',
        'unzip',
        'zip',
      ] # }

      $blacklist = [  # {
        'gpart',
        'lsscsi',
        'pciutils',
        'x86info',
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

