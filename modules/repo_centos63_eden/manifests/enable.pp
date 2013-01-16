
class repo_centos63_eden::enable {

  yumrepo { 'centos63_eden':
    name     => 'centos63_eden',
    enabled  => 1,
  }

} # class

# vim:ft=puppet:

