
class repo_centos62_eden::remove {

  file  { '/etc/yum.repos.d/centos62_eden.repo': ensure => absent,    }

} # class

# vim:ft=puppet:

