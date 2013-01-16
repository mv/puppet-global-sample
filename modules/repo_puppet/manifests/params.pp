
class repo_puppet::params {

  ### x86_64 or i686?
  $arch = $::architecture ? {
    x86_64  => 'x86_64',
    default => 'i386',
  }

  $descr = 'puppet RPMs'

  case $::operatingsystemrelease {

    ### el6
    /^6\.*/ : {
      $url   = "http://yum.puppetlabs.com/el/6/products/${arch}"
    }

    ### el5
    /^5\.*/ : {
      $url   = "http://yum.puppetlabs.com/el/5/products/${arch}"
    }

    default : {
      notice("Operating System Release [${::operatingsystemrelease}] is not defined!")
    }

  } # case

} # class

# vim:ft=puppet

