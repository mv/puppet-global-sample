
class yum_virtualbox::enable {

  yumrepo { 'virtualbox':
    name    => 'virtualbox',
    enabled => 1,
  }

}


# vim:ft=puppet

