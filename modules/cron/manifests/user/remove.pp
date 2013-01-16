
class cron::user::remove {

  ###
  ### User/Groups
  ###
  User['cron'] -> Group['cron']

  group { 'cron':    ensure => absent, }
  user  { 'cron':    ensure => absent, }

} # class

# vim:ft=puppet:

