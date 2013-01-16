
class yum_virtualbox::disable {

  yumrepo { 'virtualbox':
    name    => 'virtualbox',
    enabled => 0,
  }

}


# vim:ft=puppet

