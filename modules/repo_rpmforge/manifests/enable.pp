
class repo_rpmforge::enable {

  ### repos definition
  yumrepo { 'rpmforge':
    name    => 'rpmforge',
    enabled => 1,
  }

}

# vim:ft=puppet:

