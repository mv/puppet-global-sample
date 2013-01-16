
class repo_centos62_eden::disable {

  yumrepo { 'centos62_eden':
    name     => 'centos62_eden',
    enabled  => 0,
  }

} # class

# vim:ft=puppet:

