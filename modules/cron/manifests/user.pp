
class cron::user {

  ###
  ### User/Groups
  ###
  Group['cron'] -> User['cron']

  group { 'cron':
    ensure => present,
    gid    => '1009',
  }

  user { 'cron':
    ensure     => present,
    uid        => '1009',
    gid        => '1009',
    shell      => '/sbin/nologin',
    home       => '/var/lib/cron',
    comment    => 'Jenkins Continuous Build server',
    managehome => false,
    allowdupe  => false,
  }

} # class

# vim:ft=puppet:

