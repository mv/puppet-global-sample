
class cron::install {

# require repo_eden_rpm

  require cron::params

  package { 'cron':
    ensure  => installed,
    name    => $cron::params::pkg_name,
  }

  service { 'cron':
    ensure     => running,
    name       => $cron::params::service_name,
    enable     => true,
    hasrestart => true,
    hasstatus  => $cron::params::has_status,
    pattern    => $cron::params::process_name,
    require    => Package['cron'],
    subscribe  => File[ $cron::params::config_file ],
  }

  ###
  ### Directories,files
  ###

  ### cron-1.480-1.1
  ### rpm -qlv cron | column -t  # {
  # drwxr-xr-x  2  root  root  0      Jul  19  2011  /etc/cron.d
  # -rw-r--r--  1  root  root  113    Jul  19  2011  /etc/cron.d/0hourly
  # -rw-r--r--  1  root  root  0      Jul  19  2011  /etc/cron.deny
  # -rw-r--r--  1  root  root  293    Jul  19  2011  /etc/pam.d/crond
  # -rwxr-xr-x  1  root  root  2793   Jul  19  2011  /etc/rc.d/init.d/crond
  # -rw-r--r--  1  root  root  110    Jul  19  2011  /etc/sysconfig/crond
  # -rwsr-xr-x  1  root  root  47520  Jul  19  2011  /usr/bin/crontab
  # -rwxr-xr-x  1  root  root  59832  Jul  19  2011  /usr/sbin/crond
  # drwxr-xr-x  2  root  root  0      Jul  19  2011  /usr/share/doc/cronie-1.4.4
  # -rw-r--r--  1  root  root  48     Sep  25  2009  /usr/share/doc/cronie-1.4.4/AUTHORS
  # -rw-r--r--  1  root  root  4091   Sep  25  2009  /usr/share/doc/cronie-1.4.4/COPYING
  # -rw-r--r--  1  root  root  43891  Feb  18  2010  /usr/share/doc/cronie-1.4.4/ChangeLog
  # -rw-r--r--  1  root  root  364    Sep  25  2009  /usr/share/doc/cronie-1.4.4/INSTALL
  # -rw-r--r--  1  root  root  543    Sep  25  2009  /usr/share/doc/cronie-1.4.4/README
  # -rw-r--r--  1  root  root  2045   Jul  19  2011  /usr/share/man/man1/crontab.1.gz
  # -rw-r--r--  1  root  root  5288   Jul  19  2011  /usr/share/man/man5/crontab.5.gz
  # -rw-r--r--  1  root  root  2867   Jul  19  2011  /usr/share/man/man8/cron.8.gz
  # -rw-r--r--  1  root  root  36     Jul  19  2011  /usr/share/man/man8/crond.8.gz
  # drwx------  2  root  root  0      Jul  19  2011  /var/spool/cron
  # }

  File { owner => 'root', group => 'root', mode => '0644', require => Package['cron'] }

  ###
  ### Directories
  ###
  file {'/var/spool/cron':   ensure => directory , mode => '0700' }
  file {'/etc/cron.d':       ensure => directory , mode => '0755' }
  file {'/etc/cron.daily':   ensure => directory , mode => '0755' }
  file {'/etc/cron.hourly':  ensure => directory , mode => '0755' }
  file {'/etc/cron.monthly': ensure => directory , mode => '0755' }
  file {'/etc/cron.weekly':  ensure => directory , mode => '0755' }

  ###
  ### Files
  ###
  file {'/var/log/cron':    ensure => file , mode => '0600' }
  file {'/usr/bin/crontab': ensure => file , mode => '4755' }
  file {'/usr/sbin/crond':  ensure => file , mode => '0755' }

  file {'/etc/cron.deny':        ensure => file , source => 'puppet:///modules/cron/cron.deny' }
  file {'/etc/cron.d/0hourly':   ensure => file , source => 'puppet:///modules/cron/cron.d/0hourly' }
  file {'/etc/cron.d/dailyjobs': ensure => file , source => 'puppet:///modules/cron/cron.d/dailyjobs' }
  file {'/etc/pam.d/crond':      ensure => file , source => 'puppet:///modules/cron/crond.pamd.cfg' }

  ###
  ### Conf
  ###
  file { $cron::params::config_file :
    ensure => present,
    mode   => '0644',
    source => 'puppet:///modules/cron/crond.sysconfig.sh',
    notify => Service['cron']
  }

  file { $cron::params::init_file :
    ensure => present,
    mode   => '0755',
    source => 'puppet:///modules/cron/crond.init.sh',
  }

  file { $cron::params::crontab :
    ensure => present,
    mode   => '0644',
    source => 'puppet:///modules/cron/crontab',
  }


} # class

# vim:ft=puppet:

