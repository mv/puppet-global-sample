
class redis::user::remove {

  ###
  ### User/Groups
  ###
  User['redis'] -> Group['redis']

  group { 'redis': ensure => absent, }
  user  { 'redis': ensure => absent, }

}

# vim:ft=puppet

