
class repo_nginx::enable {

  yumrepo { 'nginx':
    name     => 'nginx',
    enabled  => 1,
  }

} # class

# vim:ft=puppet:

