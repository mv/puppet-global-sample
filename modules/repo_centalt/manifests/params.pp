
class repo_centalt::params {

    case $::operatingsystemrelease {

      ### el6
      /^6\.*/ : {
        $url   = 'http://centos.alt.ru/repository/centos/6/$basearch/'
        $descr = 'centalt: el6'
        #descr = 'CentALT Packages for Enterprise Linux 6 - $basearch'
      }

      ### el5
      /^5\.*/ : {
        $url   = 'http://centos.alt.ru/repository/centos/5/$basearch/'
        $descr = 'centalt: el5'
      }

      default : {
        notice("Operating System Release [${::operatingsystemrelease}] is not defined!")
      }

  } # case

  notice("Operating System Release: [${::operatingsystemrelease}]")

} # class

# vim:ft=puppet

