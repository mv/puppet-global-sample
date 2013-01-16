
class yum_10gen {

  include motd
  motd::register{ $module_name : }

  # Ref: http://www.mongodb.org/display/DOCS/CentOS+and+Fedora+Packages

  ### x86_64 or i686?
  $arch = $::architecture ? {
    x86_64  => 'x86_64',
    default => 'i686',
  }

  ### repos definition
  yumrepo { '10gen':
    name     => '10gen',
    descr    => '10gen RPM Repository',
    baseurl  => "http://downloads-distro.mongodb.org/repo/redhat/os/${arch}",
    enabled  => 1,
    gpgcheck => 0,
  }

}


# vim:ft=puppet

