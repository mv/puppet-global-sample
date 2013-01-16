
class repo_rpmforge::remove {

  file  { '/etc/yum.repos.d/rpmforge.repo':    ensure => absent,    }
  file  { '/etc/yum.repos.d/mirrors-rpmforge': ensure => absent,    }

}

# vim:ft=puppet:

