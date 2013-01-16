
class icinga::gui {

  include icinga
  require icinga::params

  # TODO: notify apache 'service'
# include apache::install

  package { 'icinga-gui':
    ensure  => installed,
    name    => $icinga::params::pkg_gui,
  }

  package { 'icinga-gui-depend':
    ensure  => installed,
    name    => $icinga::params::pkg_gui_dependencies,
    require => Package['icinga-gui']
  }

  File { owner => 'icinga', group => 'icinga', require => Package['icinga-gui'] }

  ### Directories AND files
  file {'/usr/lib64/icinga/cgi':         recurse => true, mode => '0775' }
  file {'/usr/share/icinga/contexthelp': recurse => true, mode => '0664' }
  file {'/usr/share/icinga/images':      recurse => true, mode => '0664' }
  file {'/usr/share/icinga/js':          recurse => true, mode => '0664' }
  file {'/usr/share/icinga/ssi':         recurse => true, mode => '0664' }
  file {'/usr/share/icinga/stylesheets': recurse => true, mode => '0664' }

  ### Files
  # TODO: vhost template
  file {'/etc/httpd/conf.d/icinga.conf': ensure => file , mode => '0644' }
  # TODO: cgi cfg template
  file {'/etc/icinga/cgi.cfg':           ensure => file , mode => '0664' }
  file {'/etc/icinga/cgiauth.cfg':       ensure => file , mode => '0664' }

  file {'/var/log/icinga/gui':
    ensure => directory,
    group  => 'icingacmd',
    mode   => '2664'
  }
  file {'/var/log/icinga/gui/.htaccess':
    ensure => file ,
    group  => 'icingacmd',
    mode   => '0664',
  }
  file {'/var/log/icinga/gui/index.htm':
    ensure => file ,
    group  => 'icingacmd',
    mode   => '0664',
  }

  ###     icinga-1.6.1   {
  # rpm -qlv icinga-gui | awk '{print $1,$3,$4,$9}' | column -t
  # }

} # class

# vim:ft=puppet:

