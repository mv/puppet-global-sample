
class repo_epel {

  include motd
  motd::register{ $module_name : }

  require repo_epel::params
  ### gpg rpm keys
  ###     Ref: https://fedoraproject.org/keys
  ###
  ### 'exec' is being used because 'package' fails with
  ### NOKEY when processing the first run.
  ###
  exec { 'epel-gpg-key':
    command   => "rpm -ivh ${repo_epel::params::url}",
    unless    => "rpm -q   ${repo_epel::params::rpm}",
    creates   => '/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL',
    path      => '/usr/bin:/bin',
    logoutput => on_failure,
  }

  ###
  yumrepo { 'epel':
    name       => 'epel',
    descr      => $repo_epel::params::descr,
    mirrorlist => $repo_epel::params::mirrorlist,
    enabled    => 1,
    gpgcheck   => 1,
    gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL',
    require    => Exec['epel-gpg-key'],
  }

  ###
  ### Obs: 'Testing' is ALWAYS disabled
  ###
  yumrepo { 'epel-testing':
    name       => 'epel-testing',
    descr      => "${repo_epel::params::descr} - Testing",
    mirrorlist => 'http://mirrors.fedoraproject.org/mirrorlist?repo=testing-epel5&arch=$basearch',
    enabled    => 0,
    gpgcheck   => 1,
    gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL',
    require    => Exec['epel-gpg-key'],
  }

  yumrepo { 'epel-testing-debuginfo':
    name       => 'epel-testing-debuginfo',
    descr      => "${repo_epel::params::descr} - Testing - Debug",
    mirrorlist => 'http://mirrors.fedoraproject.org/mirrorlist?repo=testing-debug-epel5&arch=$basearch',
    enabled    => 0,
    gpgcheck   => 1,
    gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL',
    require    => Exec['epel-gpg-key'],
  }

  yumrepo { 'epel-testing-source':
    name       => 'epel-testing-source',
    descr      => "${repo_epel::params::descr} - Testing - Source",
    mirrorlist => 'http://mirrors.fedoraproject.org/mirrorlist?repo=testing-source-epel5&arch=$basearch',
    enabled    => 0,
    gpgcheck   => 1,
    gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL',
    require    => Exec['epel-gpg-key'],
  }

}

# vim:ft=puppet

