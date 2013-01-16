
class repo_centos63_eden::disable {

  yumrepo { 'centos63_eden':
    name     => 'centos63_eden',
    enabled  => 0,
  }

} # class

# vim:ft=puppet:

