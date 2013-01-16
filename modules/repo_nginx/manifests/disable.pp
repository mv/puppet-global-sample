
class repo_nginx::disable {

  yumrepo { 'nginx':
    name     => 'nginx',
    enabled  => 0,
  }

} # class

# vim:ft=puppet:

