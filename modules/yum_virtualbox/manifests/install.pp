
class yum_virtualbox::install {

  file { 'virtualbox_gpg_key':
    ensure  => present,
    path    => '/etc/pki/rpm-gpg/RPM-GPG-KEY-virtualbox',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/yum_virtualbox/RPM-GPG-KEY-virtualbox',
  }

  yumrepo { 'virtualbox':
    name     => 'virtualbox',
    baseurl  => 'http://download.virtualbox.org/virtualbox/rpm/el/$releasever/$basearch',
    descr    => 'VirtualBox RPMs',
    enabled  => 1,
    gpgcheck => 0,
    require  => File['virtualbox_gpg_key']
  }

}

# vim:ft=puppet

