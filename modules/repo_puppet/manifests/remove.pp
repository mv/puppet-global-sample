
class repo_puppet::remove {

  file { '/etc/yum.repos.d/puppet.repo': ensure => absent, }

}


# vim:ft=puppet

