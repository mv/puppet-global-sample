
class icinga::ido::remove {

  require icinga::params

  package { 'icinga-ido':
    ensure  => absent,
    name    => $icinga::params::pkg_ido,
  }

  ### Directories AND files
# file {'/etc/icinga/idoutils': recurse => true, mode => '0644' }

  ### Config Files
# file {'/etc/icinga/ido2db.cfg':                    ensure => file , mode => '0664' }
# file {'/etc/icinga/idomod.cfg':                    ensure => file , mode => '0664' }
# file {'/etc/icinga/modules/idoutils.cfg':          ensure => file , mode => '0664' }
# file {'/etc/icinga/objects/ido2db_check_proc.cfg': ensure => file , mode => '0664' }

  ### Executables
# file {'/etc/rc.d/init.d/ido2db': ensure => file , mode => '0755' }
# file {'/usr/bin/ido2db':         ensure => file , mode => '0770' }
# file {'/usr/bin/idomod.o':       ensure => file , mode => '0770' }
# file {'/usr/bin/log2ido':        ensure => file , mode => '0770' }

} # class

# vim:ft=puppet:

