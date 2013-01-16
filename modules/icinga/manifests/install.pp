class icinga::install {

  require repo_remi

  require icinga::params
  require icinga::user

  # notify apache 'service'
# include apache::install

  package { 'icinga':
    ensure  => installed,
    name    => $icinga::params::pkg_name,
  }

  package { $icinga::params::pkg_dependencies :
    ensure  => installed,
  }

  service { 'icinga':
    ensure     => running,
    name       => $icinga::params::service_name,
    enable     => true,
    hasrestart => true,
    hasstatus  => $icinga::params::has_status,
    pattern    => $icinga::params::process_name,
    require    => Package['icinga'],
    subscribe  => File[ $icinga::params::config_file ],
  }

  ###
  ### Directories,files
  ###

  ### icinga-1.6.1
  ### rpm -qlv icinga | column -t  # {
  # drwxrwxr-x    2 icinga  icinga    /etc/icinga
  # -rw-rw-r--    1 icinga  icinga    /etc/icinga/icinga.cfg
  # drwxrwxr-x    2 icinga  icinga    /etc/icinga/modules
  # drwxrwxr-x    2 icinga  icinga    /etc/icinga/objects
  # -rw-rw-r--    1 icinga  icinga    /etc/icinga/objects/commands.cfg
  # -rw-rw-r--    1 icinga  icinga    /etc/icinga/objects/contacts.cfg
  # -rw-rw-r--    1 icinga  icinga    /etc/icinga/objects/localhost.cfg
  # -rw-rw-r--    1 icinga  icinga    /etc/icinga/objects/notifications.cfg
  # -rw-rw-r--    1 icinga  icinga    /etc/icinga/objects/printer.cfg
  # -rw-rw-r--    1 icinga  icinga    /etc/icinga/objects/switch.cfg
  # -rw-rw-r--    1 icinga  icinga    /etc/icinga/objects/templates.cfg
  # -rw-rw-r--    1 icinga  icinga    /etc/icinga/objects/timeperiods.cfg
  # -rw-rw-r--    1 icinga  icinga    /etc/icinga/objects/windows.cfg
  # -rw-rw----    1 icinga  icinga    /etc/icinga/resource.cfg
  # -rwxr-xr-x    1 root    root      /etc/rc.d/init.d/icinga
  # -rwxrwxr--    1 icinga  icinga    /usr/bin/icinga
  # -rwxrwxr--    1 icinga  icinga    /usr/bin/icingastats
  # -rw-rw-r--    1 icinga  icinga    /usr/lib64/icinga/p1.pl
  # drwxr-xr-x    2 icinga  icinga    /var/icinga
  # drwxrwxr-x    2 icinga  icinga    /var/icinga/checkresults
  # drwxr-sr-x    2 icinga  icingacm  /var/icinga/rw
  # drwxrwxr-x    2 icinga  icinga    /var/log/icinga
  # drwxrwxr-x    2 icinga  icinga    /var/log/icinga/archives
  # drwxrwxr-x    2 icinga  icinga    /var/log/icinga/gui
  # -r--r--r--    1 icinga  icinga    /var/log/icinga/gui/.htaccess
  # -rw-r--r--    1 icinga  icinga    /var/log/icinga/gui/index.htm
  # }

  File { owner => 'icinga', group => 'icinga', require => Package['icinga'] }

  ### Directories
  file {'/var/icinga/rw':
    ensure => directory ,
    owner  => 'icinga',
    group  => 'icingacmd',
    mode   => '2755',
  }

  file {'/var/log/icinga':          ensure => directory , mode => '0775' }
  file {'/var/log/icinga/archives': ensure => directory , mode => '0775' }

  file {'/etc/icinga':              ensure => directory , mode => '0775' }
  file {'/etc/icinga/modules':      ensure => directory , mode => '0775' }

  # ensure, recursively
  file {'/etc/icinga/objects':      recurse => true     , mode => '0664' }

  # create
  file {'/etc/icinga/objects/hosts':    ensure  => directory , mode => '0775' }
  file {'/etc/icinga/objects/services': ensure  => directory , mode => '0775' }

  ### Files
  file {'/var/log/icinga/checkresults':  ensure => file , mode => '0775' }

  ###
  ### Conf
  ###
  file { $icinga::params::config_file :
    ensure => present,
    source => 'puppet:///modules/icinga/icinga.cfg',
    notify => Service['icinga']
  }

  file { $icinga::params::resource_file :
    ensure => present,
    mode   => '0660' ,
    source => 'puppet:///modules/icinga/resource.cfg',
    notify => Service['icinga']
  }

  ### cfg
  file { 'commands.cfg':
    ensure => present,
    path   => "${icinga::params::config_dir}/objects/commands.cfg",
    mode   => '0664' ,
    source => 'puppet:///modules/icinga/commands.cfg',
    notify => Service['icinga']
  }



} # class

# vim:ft=puppet:

