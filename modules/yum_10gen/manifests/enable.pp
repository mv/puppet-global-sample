
class yum_10gen::enable {

  yumrepo { '10gen':
    name    => '10gen',
    enabled => 1,
  }

}


# vim:ft=puppet

