
class vagrant::user::remove {

  user  {'vagrant': ensure => absent, }

  group {'vagrant':
    ensure  => absent,
    require => User['vagrant'],
  }

}

# vim:ft=puppet

