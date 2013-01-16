

class repo_remi::disable {

  yumrepo { 'remi':
    name       => 'remi',
    enabled    => 0,
  }

}

# vim:ft=puppet:

