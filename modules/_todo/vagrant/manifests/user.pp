
class vagrant::user {

  ###
  ### from ks57/ks58/ks62 kickstart
  ###
  group { 'vagrant':
    ensure     => present,
    gid        => '497',
    allowdupe  => false,
  }

  user { 'vagrant':
    ensure     => present,
    uid        => '497',
    gid        => '497',
    shell      => '/bin/bash',
    home       => '/home/vagrant',
    comment    => 'vagrant',
    managehome => true,
    allowdupe  => false,
    require    => Group['vagrant'],
  }

  ###
  ### virtualbox additions: mount -t vboxsf
  ###
  group { 'vboxsf':
    ensure     => present,
    gid        => '498',
    allowdupe  => false,
  }

  user { 'vboxadd':
    ensure     => present,
    uid        => '498',
    gid        => '1',
    shell      => '/bin/false',
    home       => '/var/run/vboxadd',
    comment    => 'vboxadd',
    managehome => true,
    allowdupe  => false,
    require    => Group['vboxsf'],
  }

  ###
  ### ~/.ssh
  ###
  File { owner => 'vagrant', group => 'vagrant', mode => '0644' }

  file { 'vagrant_ssh':
    ensure  => directory,
    path    => '/home/vagrant/.ssh/',
    mode    => '0700',
  }

  file { 'vagrant_read_only':
    ensure  => present,
    path    => '/home/vagrant/.ssh/vagrant_read_id_rsa',
    mode    => '0600',
    source  => 'puppet:///modules/vagrant/vagrant_read_id_rsa',
    require => File['vagrant_ssh'],
  }

  file { 'vagrant_read_only_pub':
    ensure  => present,
    path    => '/home/vagrant/.ssh/vagrant_read_id_rsa.pub',
    source  => 'puppet:///modules/vagrant/vagrant_read_id_rsa.pub',
    require => File['vagrant_ssh'],
  }

  file { 'vagrant_ssh_config':
    ensure  => present,
    path    => '/home/vagrant/.ssh/config',
    source  => 'puppet:///modules/vagrant/home_ssh_config',
    require => File['vagrant_ssh'],
  }

} # class

# vim:ft=puppet

