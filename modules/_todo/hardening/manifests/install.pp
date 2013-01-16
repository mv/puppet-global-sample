
class hardening::install {

# require repo_abril

  require hardening::params

  File { owner => 'root', group => 'root', mode => '0644', }

  ###
  ### system level
  ###
  file { '/etc/inittab':               source => 'puppet:///modules/hardening/inittab', }

  file { '/etc/libuser.conf':          source => 'puppet:///modules/hardening/libuser.conf', }
  file { '/etc/modprobe.d/nousb.conf': source => 'puppet:///modules/hardening/nousb.conf', }

  file { '/etc/issue':                 source => 'puppet:///modules/hardening/issue', }
  file { '/etc/issue.net':             source => 'puppet:///modules/hardening/issue', }

  file { '/etc/login.defs':            source => 'puppet:///modules/hardening/login.defs', }
  file { '/etc/security/limits.conf':  source => 'puppet:///modules/hardening/limits.conf', }

  file { '/etc/pam.d/su':              source => 'puppet:///modules/hardening/su', }
  file { '/etc/pam.d/system-auth':     mode   => '0660', source => 'puppet:///modules/hardening/system-auth', }

  file { '/etc/profile.d/history.sh':  mode   => '0750', source => 'puppet:///modules/hardening/history.sh',  }
  file { '/usr/local/bin/wp-perms.sh': mode   => '0750', source => 'puppet:///modules/hardening/wp-perms.sh', }

  ###
  ### crond
  ###
  file { '/etc/cron.d':       ensure => directory, mode => '0700', }
  file { '/etc/cron.daily':   ensure => directory, mode => '0700', }
  file { '/etc/cron.hourly':  ensure => directory, mode => '0700', }
  file { '/etc/cron.weekly':  ensure => directory, mode => '0700', }
  file { '/etc/cron.monthly': ensure => directory, mode => '0700', }
  file { '/var/spool/cron':   ensure => directory, mode => '0700', }

  file { '/etc/crontab':      source => 'puppet:///modules/hardening/crontab', }

  ###
  ### Executables
  ###    find *bin /usr/*bin -ls | egrep 'rws|r-s|--s'
  ###

  # original: rws--x--x
  file { '/usr/bin/chfn':     mode => '0711', }
  file { '/usr/bin/chsh':     mode => '0711', }

  # original: rwsr-xr-x
  file { '/bin/ping':         mode => '0755', }  # ausente (?)
  file { '/bin/ping6':        mode => '0755', }
  file { '/bin/mount':        mode => '0755', }
  file { '/bin/umount':       mode => '0755', }
  file { '/sbin/mount.nfs':   mode => '0755', }
  file { '/sbin/umount.nfs':  mode => '0755', }
  file { '/sbin/mount.nfs4':  mode => '0755', }
  file { '/sbin/umount.nfs4': mode => '0755', }  # ausente (?)

  # original: r-xr-sr-x
  file { '/usr/bin/wall':  group => tty, mode => '0555', }
  file { '/usr/bin/write': group => tty, mode => '0755', }

  # original: rwxr-xr-x
  file { '/usr/bin/curl':  group => infra, mode => '0710', }

  # original: rws--x--x
  # remover pkg: usermode
# file { '/usr/sbin/userhelper': group => infra, mode => '4710', }

  ###
  ### Moving do app modules
  ###

  # TODO: create modules/iptables
  file { '/etc/sysconfig/iptables':
    mode   => '0600',
    source => 'puppet:///modules/hardening/iptables',
  }

  # TODO: modules/resolv
  file { '/etc/resolv.conf': source => 'puppet:///modules/hardening/resolv.conf', }

# # moved: modules/ntp
# file { '/etc/cron.hourly/ntpdate':
#   mode   => '0700',
#   source => 'puppet:///modules/hardening/ntpdate',
# }

# # moved: modules/postfilx
# file {'/etc/postfix/main.cf':
#   source => 'puppet:///modules/hardening/main.cf',
# }

  # TODO: modules/puppet
  file { '/etc/cron.hourly/puppetcron':
    mode   => '0700',
    source => 'puppet:///modules/hardening/puppet.cron.sh',
  }
  file { '/etc/puppet/puppet.conf': source => 'puppet:///modules/hardening/puppet.conf', }
  file { '/etc/sysconfig/puppet':   source => 'puppet:///modules/hardening/puppet.sysconfig.sh', }

  # moved: modules/audit
# file { '/etc/audit/auditd.conf': mode => '0640', source => 'puppet:///modules/hardening/auditd.conf', }
# file { '/etc/audit/audit.rules': mode => '0640', source => 'puppet:///modules/hardening/audit.rules', }

  # moved: modules/sudo
# file { '/etc/sudoers':
#   mode   => 0440,
#   source => 'puppet:///compartilhado/hardsec/sudoers',
# }

  # moved: modules/ssh
# file { '/etc/ssh/sshd_config':
#   mode   => '0600',
#   source => 'puppet:///compartilhado/hardsec/sshd_config',
# }

} # class

# vim:ft=puppet:

