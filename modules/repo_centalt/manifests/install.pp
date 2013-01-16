
class repo_centalt::install {

  require repo_centalt::params

  yumrepo { 'centalt':
    name       => 'centalt',
    baseurl    => $repo_centalt::params::url,
    descr      => $repo_centalt::params::descr,
    enabled    => 1,
    gpgcheck   => 0,
#   gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL',
  }

}

# vim:ft=puppet

