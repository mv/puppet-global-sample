class memcached::params {

  case $::operatingsystem {

    /RedHat|CentOS/ : {
      $pkg_name = 'memcached'
      $service_name = 'memcached'
      $user_name = 'memcached'
      $sysconfig_memcached_file_path = '/etc/sysconfig/memcached'
    }

    /Debian|Ubuntu/ : {
      $pkg_name = 'memcached'
      $service_name = 'memcached'
      $user_name = 'memcache'
      $sysconfig_memcached_file_path = '/etc/default/memcached'
    }

    default : {
      notice("Unsupported operating system: $::operatingsystem")
    }

  } # case

} # class

# vim:ft=puppet:
