
class repo_rpmforge::disable {

  ### repos definition
  yumrepo { 'rpmforge':
    name    => 'rpmforge',
    enabled => 0,
  }

}

# vim:ft=puppet:

