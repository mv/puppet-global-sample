
class repo_centos63_eden::remove {

  file  { '/etc/yum.repos.d/centos63_eden.repo': ensure => absent,    }

} # class

# vim:ft=puppet:

