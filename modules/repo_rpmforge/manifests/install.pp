
class repo_rpmforge::install {

  require repo_rpmforge::params

  $dist = $repo_rpmforge::params::dist
  $rpm  = $repo_rpmforge::params::rpm
  $url  = "http://pkgs.repoforge.org/rpmforge-release/${rpm}.rpm"

  ### gpg rpm keys
  ###     based on module 'repo-epel'
  ###
  exec { 'rpmforge-gpg-key':
    command   => "rpm -ivh ${url}",
    unless    => "rpm -q   ${rpm}",
    creates   => '/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-dag',
    path      => '/usr/bin:/bin',
    logoutput => on_failure,
  }

  ### repos definition
  yumrepo { 'rpmforge':
    name       => 'rpmforge',
    descr      => 'RPMforge.net el$releasever - dag ',
#   baseurl    => "http://apt.sw.be/redhat/${dist}/en/$basearch/rpmforge",
    mirrorlist => "http://apt.sw.be/redhat/${dist}/en/mirrors-rpmforge",
    enabled    => 1,
    gpgcheck   => 1,
    gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-dag',
    require    => Exec['rpmforge-gpg-key'],
  }

# exec { 'repolist_rpmforge':
#   command   => 'yum repolist',
#   cwd       => '/tmp',
#   path      => '/usr/local/bin:/usr/bin:/bin',
#   logoutput => on_failure,
#   require   => Yumrepo['rpmforge']
# }


}

# vim:ft=puppet:

