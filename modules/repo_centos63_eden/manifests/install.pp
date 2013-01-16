
class repo_centos63_eden::install {

  yumrepo { 'centos63_eden':
    name     => 'centos63_eden',
    descr    => 'CentOS 6.3: Eden',
    baseurl  => 'http://rpm-01.edenbrasil.com.br/iso/centos63',
    gpgcheck => 1,
    enabled  => 1,
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
#   exclude  => '[A-Z]*-??-??.noarch',  # Documentation
    exclude  => '[A-Z]*-??-??.noarch mysql*-5.0* *ruby*',
    require  => File['RPM-GPG-KEY-CentOS-6'],
  }

  file { 'RPM-GPG-KEY-CentOS-6':
    ensure  => present,
    path    => '/etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/repo_centos63_eden/RPM-GPG-KEY-CentOS-6',
  }

} # class

# vim:ft=puppet:

