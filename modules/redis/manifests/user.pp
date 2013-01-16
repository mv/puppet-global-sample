
class redis::user {

  ###
  ### User/Groups
  ###
  Group['redis'] -> User['redis']

  group { 'redis':
    ensure     => present,
    gid        => '1008',
  }

  user { 'redis':
    ensure     => present,
    uid        => '1008',
    gid        => '1008',
    shell      => '/sbin/nologin',
    home       => '/var/lib/redis',
    comment    => 'Redis Server', # -M -r
    managehome => false,
    allowdupe  => false,
    system     => true,
  }

}

# vim:ft=puppet

