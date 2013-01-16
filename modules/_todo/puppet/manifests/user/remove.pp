
class puppet::user::remove {

  user  {'puppet': ensure => absent, }

  group {'puppet':
    ensure  => absent,
    require => User['puppet'],
  }

}

# vim:ft=puppet

