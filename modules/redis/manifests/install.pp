
class redis::install {

# require repo_eden_rpm

  require redis::params
  require redis::user

  package { 'redis':
    ensure  => installed,
    name    => $redis::params::pkg_name,
  }

  service { 'redis':
    ensure     => running,
    name       => $redis::params::service_name,
    enable     => true,
    hasrestart => true,
    hasstatus  => $redis::params::has_status,
    pattern    => $redis::params::process_name,
    require    => Package['redis'],
    subscribe  => File[ $redis::params::config_file ],
  }

  ###
  ### Directories,files
  ###

  ### redis-2.4.16
  ### rpm -qlv redis | column -t  # {
  # -rw-r--r--  1  root   root  131     Aug  23  14:35  /etc/logrotate.d/redis
  # -rwxr-xr-x  1  root   root  1541    Aug  23  14:35  /etc/rc.d/init.d/redis
  # -rw-r--r--  1  root   root  21163   Aug  23  14:35  /etc/redis.conf
  # -rwxr-xr-x  1  root   root  248103  Aug  23  14:35  /usr/bin/redis-benchmark
  # -rwxr-xr-x  1  root   root  14084   Aug  23  14:35  /usr/bin/redis-check-aof
  # -rwxr-xr-x  1  root   root  20811   Aug  23  14:35  /usr/bin/redis-check-dump
  # -rwxr-xr-x  1  root   root  273822  Aug  23  14:35  /usr/bin/redis-cli
  # -rwxr-xr-x  1  root   root  500497  Aug  23  14:35  /usr/sbin/redis-server
  # drwxr-xr-x  2  root   root  0       Aug  23  14:35  /usr/share/doc/redis-2.4.16
  # -rw-r--r--  1  root   root  12723   Aug  1   06:59  /usr/share/doc/redis-2.4.16/00-RELEASENOTES
  # -rw-r--r--  1  root   root  55      Aug  1   06:59  /usr/share/doc/redis-2.4.16/BUGS
  # -rw-r--r--  1  root   root  1487    Aug  1   06:59  /usr/share/doc/redis-2.4.16/COPYING
  # -rw-r--r--  1  root   root  2813    Aug  1   06:59  /usr/share/doc/redis-2.4.16/README
  # drwxr-xr-x  2  redis  root  0       Aug  23  14:35  /var/lib/redis
  # drwxr-xr-x  2  redis  root  0       Aug  23  14:35  /var/log/redis
  # drwxr-xr-x  2  redis  root  0       Aug  23  14:35  /var/run/redis
  # }

  File { owner => 'root', group => 'root', mode => '0755', require => Package['redis'] }

  ### Directories
  file {'/var/lib/redis': ensure => directory , owner => 'redis' }
  file {'/var/log/redis': ensure => directory , owner => 'redis' }
  file {'/var/run/redis': ensure => directory , owner => 'redis' }
  file {'/etc/redis.d':   ensure => directory , owner => 'redis' } # mvf: extra

  ### Files
  file { '/usr/bin/redis-benchmark':  ensure => file, mode => '0755' }
  file { '/usr/bin/redis-check-aof':  ensure => file, mode => '0755' }
  file { '/usr/bin/redis-check-dump': ensure => file, mode => '0755' }
  file { '/usr/bin/redis-cli':        ensure => file, mode => '0755' }
  file { '/usr/sbin/redis-server':    ensure => file, mode => '0755' }

  ###
  ### Conf
  ###
  file { $redis::params::config_file :
    ensure => present,
    mode   => '0644',
    source => 'puppet:///modules/redis/redis.conf',
    notify => Service['redis']
  }

  file { $redis::params::init_file :
    ensure => present,
    mode   => '0755',
    source => 'puppet:///modules/redis/redis.init.sh',
  }

  file { $redis::params::rotate_cfg :
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/redis/redis.logrotate',
  }

} # class

# vim:ft=puppet:

