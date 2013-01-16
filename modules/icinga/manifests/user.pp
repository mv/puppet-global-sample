class icinga::user {

  ###
  ### User/Groups
  ###
  Group['icinga'] -> User['icinga']

  group { 'icinga':
    ensure => present,
    gid    => '1005',
  }

  group { 'icingacmd':
    ensure => present,
    gid    => '1006',
  }

  user { 'icinga':
    ensure     => present,
    uid        => '1005',
    gid        => '1005',
    shell      => '/sbin/nologin',
    home       => '/var/icinga',
    comment    => 'Icinga',
    groups     => [ 'icingacmd' ],
    managehome => false,
    allowdupe  => false,
  }

} # class

# vim:ft=puppet:

