
class repo_nginx::install {

  yumrepo { 'nginx':
    name     => 'nginx',
    descr    => 'Nginx repo',
    baseurl  => 'http://nginx.org/packages/rhel/6/$basearch/',
    gpgcheck => 1,
    enabled  => 1,
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-nginx',
    require  => File['nginx-gpg.key'],
  }

  file { 'nginx-gpg.key':
    ensure => present,
    path   => '/etc/pki/rpm-gpg/RPM-GPG-KEY-nginx',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/repo_nginx/RPM-GPG-KEY-nginx',
  }

} # class

# vim:ft=puppet:

