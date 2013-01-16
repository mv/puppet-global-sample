
class repo_centos62_eden::install {

  file { 'centos62_gpg_key':
    ensure  => present,
    path    => '/etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-62',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/repo_centos62_eden/RPM-GPG-KEY-CentOS-6',
  }

  yumrepo { 'centos62_eden':
    name     => 'centos62_eden',
    descr    => 'CentOS 6.2: Eden',
    baseurl  => 'http://rpm-01.edenbrasil.com.br/iso/centos62',
    gpgcheck => 1,
    enabled  => 1,
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-62',
#   exclude  => '[A-Z]*-??-??.noarch',  # Documentation
    exclude  => '[A-Z]*-??-??.noarch mysql*-5.0* *ruby*',
    require  => File['centos62_gpg_key'],
  }

  exec { 'centos62_eden_refresh':
    command   => 'yum repolist all | grep centos62_eden | column -t',
    cwd       => '/tmp',
    path      => '/usr/local/bin:/usr/bin:/bin',
#   creates   => '/var/cache/yum/eden_rpm/packages',
    logoutput => true,
    require   => Yumrepo['centos62_eden']
  }

} # class

# vim:ft=puppet:

