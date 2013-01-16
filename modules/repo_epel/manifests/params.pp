
class repo_epel::params {

    case $::operatingsystemrelease {

      ### el6
      /^6\.*/ : {
        $rpm        = 'epel-release-6-7.noarch'
        $url        = "http://download.fedoraproject.org/pub/epel/6/i386/${rpm}.rpm"
        $mirrorlist = 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=$basearch'
        $descr      = 'EPEL: el6 - $basearch'
      }

      ### el5
      /^5\.*/ : {
        $rpm        = 'epel-release-5-4.noarch.rpm'
        $url        = "http://dl.fedoraproject.org/pub/epel/5/i386/${rpm}"
        $mirrorlist = 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-5&arch=$basearch'
        $descr      = 'EPEL: el5 - $basearch'
      }

      default : {
        notice("Operating System Release [${::operatingsystemrelease}] is not defined!")
      }

  } # case

  notice("Operating System Release: [${::operatingsystemrelease}]")

} # class

# vim:ft=puppet

