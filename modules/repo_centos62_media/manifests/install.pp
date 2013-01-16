
class repo_centos62_media::install {

  ###
  ### From original file:
  ###
    # CentOS-Media.repo
    #
    # This repo is used to mount the default locations for a CDROM / DVD on
    #  CentOS-5.  You can use this repo and yum to install items directly off the
    #  DVD ISO that we release.
    #
    # To use this repo, put in your DVD and use it with the other repos too:
    #  yum --enablerepo=c5-media [command]
    #
    # or for ONLY the media repo, do this:
    #
    #  yum --disablerepo=\* --enablerepo=c5-media [command]

  ###
  ### Obs: CD/DVD/ISO must be present!!!
  ###    Physical machine: put DVD in tray
  ###    Virtual  machine: attach iso file
  ###

  require repo_centos62_media::params

  file { '/media/cdrom':
    ensure => directory,
  }

  mount { '/media/cdrom':
    ensure  => mounted,
    device  => '/dev/cdrom',
    fstype  => 'iso9660',
    options => 'ro',
    atboot  => false,
    require => File['/media/cdrom']
  }

  yumrepo { $repo_centos62_media::params::repo :
    name     => 'CentOS-Media',
    descr    => 'CentOS-$releasever - Media',
    baseurl  => 'file:///media/cdrom/',
    gpgcheck => 1,
    enabled  => 1,
    gpgkey   => $repo_centos62_media::params::gpgkey,
    exclude  => '[A-Z]*-??-??.noarch mysql*-5.0* *ruby*',
    require  => Mount['/media/cdrom']
  }

  exec { 'repolist_centos_media':
    command   => 'yum repolist',
    cwd       => '/tmp',
    path      => '/usr/local/bin:/usr/bin:/bin',
    logoutput => on_failure,
    require   => Yumrepo[ $repo_centos62_media::params::repo ]
  }

} # class

# vim:ft=puppet:

