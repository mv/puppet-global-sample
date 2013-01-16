
class foo_server::server::install {

  include motd
  motd::register{ $module_name : }

# require repo_abril

  require foo_server::params
  require foo_server::client::install

  package { 'foo-server':
    ensure   => installed,
    name     => $foo_server::params::pkg_name_server,
    require  => Package['foo_server_dependencies'],
  }

  package { 'foo_server_dependencies':
    ensure => present,
    name   => $foo_server::params::server_dependencies,
  }

  file { 'foo.conf':
    ensure  => present,
    path    => $foo_server::params::config_file,
    owner   => 'foo',
    group   => 'foo',
    mode    => '0644',
    content => template('foo/template.erb'),
    require => Package['foo-server'],
  }

  service { 'foo':
    ensure  => running,
    name    => $foo_server::params::service_name,
    enable  => true,
    pattern => 'food',
    require => [ File['foo.conf'], User['foo'], ],
  }

  user { 'foo':
    ensure   => present,
    uid      => 27,
    gid      => 27,
    home     => '/var/empty/foo',
    shell    => '/sbin/nologin',
  # password => '*LK*',
    require  => Group['foo']
  }

  group { 'foo':
    ensure => present,
    gid    => 27,
  }

}

# vim:ft=puppet:

