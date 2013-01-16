
class mongo::server::install {

# include motd
# motd::register{ $module_name : }

# require yum_10gen

  require mongo::params
  require mongo::user
  require mongo::client::install

  package { 'mongo-server':
    ensure   => installed,
    name     => $mongo::params::pkg_name_server,
  }

  service { 'mongod':
    ensure  => running,
    name    => $mongo::params::service_name,
    enable  => true,
    pattern => 'mongod',
    require => Package['mongo-server'],
  }

  # -rw-r--r--  1  root    root    1657      Aug  29  02:42  /etc/mongod.conf
  # -rwxr-xr-x  1  root    root    2030      Aug  29  02:42  /etc/rc.d/init.d/mongod
  # -rw-r--r--  1  root    root    47        Aug  29  02:42  /etc/sysconfig/mongod
  # -rwxr-xr-x  1  root    root    10493288  Aug  29  02:42  /usr/bin/mongod
  # -rwxr-xr-x  1  root    root    6766992   Aug  29  02:42  /usr/bin/mongos
  # -rw-r--r--  1  root    root    468       Aug  29  02:42  /usr/share/man/man1/mongod.1
  # -rw-r--r--  1  root    root    2015      Aug  29  02:42  /usr/share/man/man1/mongos.1
  # drwxr-xr-x  2  mongod  mongod  0         Aug  29  02:42  /var/lib/mongo
  # drwxr-xr-x  2  mongod  mongod  0         Aug  29  02:42  /var/log/mongo
  # -rw-r-----  1  mongod  mongod  0         Aug  29  02:42  /var/log/mongo/mongod.log

  file { 'mongod.conf':
    ensure  => present,
    path    => $mongo::params::config_file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/mongo/mongod.conf',
    require => Package['mongo-server'],
  }

  file { '/etc/monit.d/mongod.monit.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/mongo/mongod.monit.conf',
  }

  ###
  ### directories
  ###
  file { ['/mongo',
          '/mongo/data',
          ]:
    ensure  => directory,
    owner   => 'mongod',
    group   => 'mongod',
    mode    => '0755',
    recurse => false,
    require => User['mongod'],
  }

  file { '/var/lib/mongo':
    ensure => link,
    target => '/mongo',
    force  => true,
  }

  file { '/var/empty/mongo':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

}

# vim:ft=puppet:

