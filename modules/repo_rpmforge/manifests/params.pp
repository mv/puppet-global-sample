
class repo_rpmforge::params {

  # http://repoforge.org/use/
  #   EL 6: i686, x86_64
  #   EL 5: i386, x86_64, ppc
  #   EL 4: i386, x86_64, ppc
  #   EL 3: i386, x86_64

# $arch = $::architecture ? {
#   x86_64  => 'x86_64',
#   default => 'i386',
# }

  $rpm_base = 'rpmforge-release-0.5.2-2'

  case $::operatingsystemrelease {
    /6.?/ : {
      $dist = 'el6'
      $rpm  = "${rpm_base}.${dist}.rf.${$::architecture}"
#     $url  = "http://pkgs.repoforge.org/rpmforge-release/${rpm}.rpm"
    }
    /5.?/ : {
      $dist = 'el5'
      $rpm  = "${rpm_base}.${dist}.rf.${$::architecture}"
#     $url  = "http://pkgs.repoforge.org/rpmforge-release/${rpm}.rpm"
    }
    default : {
      notice("Operating System Release [${::operatingsystemrelease}] is not defined!")
    }

  } # end case

  notice("Operating System Release [${::operatingsystemrelease}]")
  notice("Operating System Distribution [${dist}]")

} # end class

# vim:ft=puppet:

