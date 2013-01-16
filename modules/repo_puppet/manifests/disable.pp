
class repo_puppet::disable {

  yumrepo { 'puppet':
    name    => 'puppet',
    enabled => 0,
  }

}


# vim:ft=puppet

