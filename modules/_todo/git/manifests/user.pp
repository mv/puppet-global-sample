
class git::user {

  ###
  ### User/Groups
  ###
  Group['git'] -> User['git']

  group { 'git':
    ensure     => present,
    gid        => '1013',
    allowdupe  => false,
  }

  user { 'git':
    ensure     => present,
    uid        => '1013',
    gid        => '1013',
    shell      => '/usr/bin/git-shell',
    home       => '/var/empty/git',
    comment    => 'Git',
    managehome => false,
    allowdupe  => false,
  }

}

# vim:ft=puppet

