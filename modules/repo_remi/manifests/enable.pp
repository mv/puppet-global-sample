

class repo_remi::enable {

  yumrepo { 'remi':
    name       => 'remi',
    enabled    => 1,
  }

}

# vim:ft=puppet:

