
class yum_10gen::disable {

  yumrepo { '10gen':
    name    => '10gen',
    enabled => 0,
  }

}


# vim:ft=puppet

