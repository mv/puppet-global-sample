

class repo_remi {

  include motd
  motd::register{ $module_name : }

  # Ref: http://blog.famillecollet.com/pages/Config-en
  include repo_epel

# $rpm = $operatingsystemrelease ? {
#   /6.?/ => 'http://rpms.famillecollet.com/enterprise/remi-release-6.rpm',
#   /5.?/ => 'http://rpms.famillecollet.com/enterprise/remi-release-5.rpm',
# }

  # Ref: https://fedoraproject.org/keys
  ### gpg rpm keys
  exec { 'remi-gpg-key':
    command   => 'curl http://rpms.famillecollet.com/RPM-GPG-KEY-remi -o /etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
    creates   => '/etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
    path      => '/usr/bin:/bin',
    logoutput => on_failure,
  }

  ### repos definition
  yumrepo { 'remi':
    name       => 'remi',
    descr      => 'Les RPM de remi pour Enterprise Linux $releasever - $basearch',
    mirrorlist => 'http://rpms.famillecollet.com/enterprise/$releasever/remi/mirror',
    enabled    => 1,
    gpgcheck   => 1,
    gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
    require    => Exec['remi-gpg-key'],
  }

}

# vim:ft=puppet:

