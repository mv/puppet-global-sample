
class mongo::user {

  ###
  ### User/Groups
  ###
  Group['mongod'] -> User['mongod']

  group { 'mongod':
    ensure => present,
    gid    => '27',
  }

  user { 'mongod':
    ensure     => present,
    uid        => '27',
    gid        => '27',
    shell      => '/sbin/nologin',
    home       => '/var/empty/mongo',
    comment    => 'MongoDB Server',
    password   => '*LK*',
    managehome => false,
    allowdupe  => false,
  }

} # class

# vim:ft=puppet:

