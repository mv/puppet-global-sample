
class repo_nginx::remove {

  file  { '/etc/yum.repos.d/nginx.repo': ensure => absent,    }

} # class

# vim:ft=puppet:

