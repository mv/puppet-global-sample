
class repo_centos::original {

  ###
  ### Original from distro
  ###

  File { owner => 'root', group => 'root', mode => '0644' }

  file { '/etc/yum.repos.d/CentOS-Base.repo':
    ensure => present,
    source => 'puppet:///modules/repo_centos/CentOS-Base.repo',
  }

  file { '/etc/yum.repos.d/CentOS-Debuginfo.repo':
    ensure => present,
    source => 'puppet:///modules/repo_centos/CentOS-Debuginfo.repo',
  }

# file { '/etc/yum.repos.d/CentOS-Media.repo':
#   ensure => present,
#   source => 'puppet:///modules/repo_centos/CentOS-Media.repo',
# }

  file { '/etc/yum.repos.d/CentOS-Vault.repo':
    ensure => present,
    source => 'puppet:///modules/repo_centos/CentOS-Vault.repo',
  }

  ###
  ### yumrep in install.pp creates these files: removing
  ###
  file { '/etc/yum.repos.d/CentOS-Contrib.repo': ensure => absent, }
  file { '/etc/yum.repos.d/CentOS-Extras.repo':  ensure => absent, }
  file { '/etc/yum.repos.d/CentOS-Plus.repo':    ensure => absent, }
  file { '/etc/yum.repos.d/CentOS-Updates.repo': ensure => absent, }

} # class

# vim:ft=puppet:

