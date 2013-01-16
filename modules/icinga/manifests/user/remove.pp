
class icinga::user::remove {

  ###
  ### User/Groups
  ###
  User['icinga'] -> Group['icinga']

  group { 'icinga':    ensure => absent, }
  group { 'icingacmd': ensure => absent, }
  user  { 'icinga':    ensure => absent, }

} # class

# vim:ft=puppet:

