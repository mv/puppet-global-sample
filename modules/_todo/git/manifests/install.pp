
class git::install {

# require repo_eden_rpm
  require git::params

  package { 'git':
    ensure => installed,
    name   => $git::params::pkg_name,
  }

  ### git-1.7.11-3
  ### rpm -qlv git | column -t  # {
  # drwxr-xr-x  2    root  root  0        Aug  29  19:43  /etc/bash_completion.d
  # -rw-r--r--  1    root  root  56139    Aug  29  19:43  /etc/bash_completion.d/git
  # -rwxr-xr-x  1    root  root  1558953  Aug  29  19:43  /usr/bin/git
  # -rwxr-xr-x  1    root  root  120917   Aug  29  19:43  /usr/bin/git-cvsserver
  # -rwxr-xr-x  1    root  root  1558953  Aug  29  19:43  /usr/bin/git-receive-pack
  # -rwxr-xr-x  1    root  root  664450   Aug  29  19:43  /usr/bin/git-shell
  # -rwxr-xr-x  1    root  root  1558953  Aug  29  19:43  /usr/bin/git-upload-archive
  # -rwxr-xr-x  1    root  root  686613   Aug  29  19:43  /usr/bin/git-upload-pack
  # drwxr-xr-x  2    root  root  0        Aug  29  19:43  /usr/libexec/git-core
  # -rwxr-xr-x  107  root  root  1558953  Aug  29  19:43  /usr/libexec/git-core/git-*
  # drwxr-xr-x  2    root  root  0        Aug  29  19:43  /usr/libexec/git-core/mergetools
  # -rw-r--r--  1    root  root  392      Jul  22  17:44  /usr/libexec/git-core/mergetools/araxis
  # -rw-r--r--  1    root  root  401      Jul  22  17:44  /usr/libexec/git-core/mergetools/bc3
  # -rw-r--r--  1    root  root  695      Jul  22  17:44  /usr/libexec/git-core/mergetools/defaults
  # -rw-r--r--  1    root  root  628      Jul  22  17:44  /usr/libexec/git-core/mergetools/deltawalker
  # -rw-r--r--  1    root  root  282      Jul  22  17:44  /usr/libexec/git-core/mergetools/diffuse
  # -rw-r--r--  1    root  root  340      Jul  22  17:44  /usr/libexec/git-core/mergetools/ecmerge
  # -rw-r--r--  1    root  root  415      Jul  22  17:44  /usr/libexec/git-core/mergetools/emerge
  # -rw-r--r--  1    root  root  506      Jul  22  17:44  /usr/libexec/git-core/mergetools/kdiff3
  # -rw-r--r--  1    root  root  83       Jul  22  17:44  /usr/libexec/git-core/mergetools/kompare
  # -rw-r--r--  1    root  root  680      Jul  22  17:44  /usr/libexec/git-core/mergetools/meld
  # -rw-r--r--  1    root  root  301      Jul  22  17:44  /usr/libexec/git-core/mergetools/opendiff
  # -rw-r--r--  1    root  root  191      Jul  22  17:44  /usr/libexec/git-core/mergetools/p4merge
  # -rw-r--r--  1    root  root  224      Jul  22  17:44  /usr/libexec/git-core/mergetools/tkdiff
  # -rw-r--r--  1    root  root  279      Jul  22  17:44  /usr/libexec/git-core/mergetools/tortoisemerge
  # -rw-r--r--  1    root  root  785      Jul  22  17:44  /usr/libexec/git-core/mergetools/vim
  # -rw-r--r--  1    root  root  618      Jul  22  17:44  /usr/libexec/git-core/mergetools/xxdiff
  # drwxr-xr-x  2    root  root  0        Aug  29  19:43  /usr/share/git-core/contrib
  # drwxr-xr-x  2    root  root  0        Jul  22  17:44  /usr/share/git-core/contrib/hooks
  # -rwxr-xr-x  1    root  root  21536    Jul  22  17:44  /usr/share/git-core/contrib/hooks/post-receive-email
  # -rwxr-xr-x  1    root  root  1291     Jul  22  17:44  /usr/share/git-core/contrib/hooks/pre-auto-gc-battery
  # -rwxr-xr-x  1    root  root  6920     Jul  22  17:44  /usr/share/git-core/contrib/hooks/setgitperms.perl
  # -rwxr-xr-x  1    root  root  11647    Jul  22  17:44  /usr/share/git-core/contrib/hooks/update-paranoid
  # }

  File { owner => 'root', group => 'root', mode => '0644' }

  file { 'git':
    ensure => present,
    path   => '/usr/bin/git',
    mode   => '0555',
  }

  file { '/etc/skel/dot.git':
    ensure => present,
    source => 'puppet:///modules/git/dot.git',
  }

  file { '/root/dot.git':
    ensure => present,
    source => 'puppet:///modules/git/dot.git',
  }


} # class

# vim:ft=puppet:

