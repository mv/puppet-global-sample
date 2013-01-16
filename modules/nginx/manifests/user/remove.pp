
class nginx::user::remove {

  ###
  ### User/Groups
  ###
  User['nginx'] -> Group['nginx']

  group { 'nginx': ensure => absent, }
  user  { 'nginx': ensure => absent, }

} # class

# vim:ft=puppet:

