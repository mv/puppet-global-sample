
class puppet::user {

  group { 'puppet':
    ensure     => present,
    gid        => '20001',
    allowdupe  => false,
  }

  user { 'puppet':
    ensure     => present,
    uid        => '20001',
    gid        => '20001',
    shell      => '/bin/bash',
    home       => '/home/puppet',
    comment    => 'Puppet',
    managehome => true,
    allowdupe  => false,
    require    => Group['puppet'],
  }

}

# vim:ft=puppet

