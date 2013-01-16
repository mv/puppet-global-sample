
class mytop::install {

# require repo_eden_rpm
  require mytop::params

  package { 'mytop':
    ensure => installed,
    name   => $mytop::params::pkg_name,
  }

  ### mytop-1.480-1.1
  ### rpm -qlv mytop | column -t  # {
  # -r-xr-xr-x 1 root root 48620 Nov 12 2010 /usr/bin/mytop
  # drwxr-xr-x 2 root root 0     Nov 12 2010 /usr/share/doc/mytop-1.4
  # -rw-r--r-- 1 root root 6500  Aug 3  2003 /usr/share/doc/mytop-1.4/Changes
  # -rw-r--r-- 1 root root 20    Apr 27 2002 /usr/share/doc/mytop-1.4/INSTALL
  # -rw-r--r-- 1 root root 58    Apr 27 2002 /usr/share/doc/mytop-1.4/MANIFEST
  # -rw-r--r-- 1 root root 1003  Aug 3  2003 /usr/share/doc/mytop-1.4/README
  # -r--r--r-- 1 root root 9301  Nov 12 2010 /usr/share/man/man1/mytop.1.gz
  # }

  File { owner => 'root', group => 'root', mode => '0644' }

  file { 'mytop':
    ensure => present,
    path   => '/usr/bin/mytop',
    mode   => '0555',
  }

  file { '/etc/skel/dot.mytop':
    ensure => present,
    source => 'puppet:///modules/mytop/dot.mytop',
  }

  file { '/root/dot.mytop':
    ensure => present,
    source => 'puppet:///modules/mytop/dot.mytop',
  }


} # class

# vim:ft=puppet:

