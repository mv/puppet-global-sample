
class icinga::ido {

  require icinga
  require icinga::params

  package { 'icinga-ido':
    ensure  => installed,
    name    => $icinga::params::pkg_ido,
  }

  # TODO: ido2db service configuration
  service { 'ido2db':
    ensure     => running,
    name       => 'ido2db', # $icinga::params::service_name,
    enable     => true,
    hasrestart => true,
    hasstatus  => true, # $icinga::params::has_status,
#   pattern    => $icinga::params::process_name,
    require    => Package['icinga-ido'],
#   subscribe  => File[ $icinga::params::config_file ],
  }


  File { owner => 'icinga', group => 'icinga', require => Package['icinga-gui'] }

  ### Directories AND files
  file {'/etc/icinga/idoutils': recurse => true, mode => '0644' }

  ### Config Files
  # TODO: ido cfg template files
  file {'/etc/icinga/ido2db.cfg':                    ensure => file , mode => '0664' }
  file {'/etc/icinga/idomod.cfg':                    ensure => file , mode => '0664' }
  file {'/etc/icinga/modules/idoutils.cfg':          ensure => file , mode => '0664' }
  file {'/etc/icinga/objects/ido2db_check_proc.cfg': ensure => file , mode => '0664' }

  ### Executables
  file {'/etc/rc.d/init.d/ido2db': ensure => file , mode => '0755' }
  file {'/usr/bin/ido2db':         ensure => file , mode => '0770' }
  file {'/usr/bin/idomod.o':       ensure => file , mode => '0770' }
  file {'/usr/bin/log2ido':        ensure => file , mode => '0770' }

  ###     icinga-1.6.1   {
  # rpm -qlv icinga-adoutils | awk '{print $1,$3,$4,$9}' | column -t
  # }

} # class

# vim:ft=puppet:

