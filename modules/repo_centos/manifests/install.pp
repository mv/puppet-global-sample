
class repo_centos::install {

  ###
  ### Using mirrors from distro
  ###

  ### Toggle Base/Media
# include repo_centos_media::disable

  ###
  ### Config
  ###
  File { owner => 'root', group => 'root', mode => '0644' }

  file { 'centos_gpg_key':
    ensure => present,
    path   => '/etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
    source => 'puppet:///modules/repo_centos/RPM-GPG-KEY-CentOS-6',
  }

  yumrepo { 'base':
    name       => 'CentOS-Base',
    descr      => 'CentOS-$releasever - Base',
#   baseurl    => 'http://mirror.centos.org/centos/$releasever/os/$basearch/',
    mirrorlist => 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os',
    enabled    => 1,
    gpgcheck   => 1,
    gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
  }

  yumrepo { 'updates':
    name       => 'CentOS-Updates',
    descr      => 'CentOS-$releasever - Updates',
    baseurl    => 'http://mirror.centos.org/centos/$releasever/updates/$basearch/',
    mirrorlist => 'http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=updates',
    enabled    => 0,
    gpgcheck   => 1,
    gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
  }

  ###
  ### Forcibly removing
  ###
# file { '/etc/yum.repos.d/CentOS-Vault.repo':
#   ensure => absent,
# }

  ###
  ### Forcibly disabling
  ###
  yumrepo { 'extras':
    name       => 'CentOS-Extras',
    descr      => 'CentOS-$releasever - Extras',
    enabled    => 0,
  }

  yumrepo { 'centosplus':
    name       => 'CentOS-Plus',
    descr      => 'CentOS-$releasever - Plus',
    enabled    => 0,
  }

  yumrepo { 'contrib':
    name       => 'CentOS-Contrib',
    descr      => 'CentOS-$releasever - Contrib',
    enabled    => 0,
  }

  yumrepo { 'debug':
    name       => 'CentOS-Debuginfo',
    descr      => 'CentOS-$releasever - Debuginfo',
    enabled    => 0,
  }

} # class

# vim:ft=puppet:

