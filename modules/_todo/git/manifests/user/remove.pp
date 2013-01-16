
class git::user::remove {

  ###
  ### User/Groups
  ###
  User['git'] -> Group['git']

  group {'git': ensure => absent, }
  user  {'git': ensure => absent, }

}

# vim:ft=puppet

