
class repo_centos62_media::params {

    case $::operatingsystemrelease {

      ### el6
      /^6\.*/ : {
        $repo   = 'c6_media'
        $gpgkey = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6'
      }

      ### el5
      /^5\.*/ : {
        $repo   = 'c5_media'
        $gpgkey = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-5'
      }

      default : {
        notice("Operating System Release [${::operatingsystemrelease}] is not defined!")
      }

  } # case

  notice("Operating System Release: [${::operatingsystemrelease}]")

} # class

# vim:ft=puppet

