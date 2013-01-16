
class repo_puppet::install {

  require repo_puppet::params

  file { 'puppet_gpg_key':
    ensure  => present,
    path    => '/etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/repo_puppet/RPM-GPG-KEY-puppetlabs',
  }

  file { 'reductive_gpg_key':
    ensure  => present,
    path    => '/etc/pki/rpm-gpg/RPM-GPG-KEY-reductive',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/repo_puppet/RPM-GPG-KEY-reductive',
  }

  yumrepo { 'puppet':
    name     => 'puppet',
    baseurl  => $repo_puppet::params::url   ,
    descr    => $repo_puppet::params::descr ,
    enabled  => 1,
    gpgcheck => 1,
    require  => File['puppet_gpg_key']
  }

}

# vim:ft=puppet

