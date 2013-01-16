
class repo_puppet::enable {

  yumrepo { 'puppet':
    name    => 'puppet',
    enabled => 1,
  }

}


# vim:ft=puppet

