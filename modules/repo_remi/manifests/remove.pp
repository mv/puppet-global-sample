
class repo_remi::remove {

  ###
  file { '/etc/yum.repos.d/remi.repo': ensure => absent, }

}

# vim:ft=puppet


