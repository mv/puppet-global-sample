
class tools_dev::params  {

  ###
  ### whitelist: can be removed in prod
  ### whitelist: can be kept in prod
  ###

  case $::operatingsystem {

    /(RedHat|CentOS)/ : {

      # curl -> openssl -> zlib
      # glibc-devel -> glibc-headers

      $blacklist = [  # {
        'curl-devel'   ,
        'expat-devel'  ,
        'freetype-devel',
        'gdbm-devel'   ,
        'gettext-devel',
        'glibc-devel'  ,
        'glibc-headers',
        'kernel-devel' ,
        'kernel-headers',
        'libevent-devel',
        'libgcrypt-devel',
        'ncurses-devel',
        'libxml2-devel',
        'libxslt-devel',
        'openssl-devel',
        'readline-devel',
        'libaio-devel',
        'rpm-build'    ,
        'rpm-devel',
        'sqlite-devel',
        'zlib-devel',
        'gcc' , 'gcc-c++', 'make'   , 'imake',
        'automake', 'autoconf', 'm4', 'bison',
        'binutils', 'patch'   , 'cvs',
      ] # }

      $whitelist = [  # {
        'ack',
        'git',
#       'perl-Git',
        'diffutils',
        'libevent',
        'libaio',
      ] # }
    }

    /(Debian|Ubuntu)/ : {
      $blacklist = ''
      $whitelist = ''
    }

    default : {
      $blacklist = ''
      $whitelist = ''
    }

  } # case

}

# vim:ft=puppet:

