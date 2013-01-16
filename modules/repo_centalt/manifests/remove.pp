
class repo_centalt::remove {

  ###
  file { '/etc/yum.repos.d/centalt.repo': ensure => absent, }

}

# vim:ft=puppet

