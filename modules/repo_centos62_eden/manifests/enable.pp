
class repo_centos62_eden::enable {

  yumrepo { 'centos62_eden':
    name     => 'centos62_eden',
    enabled  => 1,
  }

} # class

# vim:ft=puppet:

