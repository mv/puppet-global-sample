class nginx::user {

  ###
  ### User/Groups
  ###
  Group['nginx'] -> User['nginx']

  group { 'nginx':
    ensure => present,
    gid    => '1010',
  }

  user { 'nginx':
    ensure     => present,
    uid        => '1010',
    gid        => '1010',
    shell      => '/sbin/nologin',
    home       => '/var/cache/nginx',
    comment    => 'Nginx',
    managehome => false,
    allowdupe  => false,
  }

} # class

# vim:ft=puppet:

