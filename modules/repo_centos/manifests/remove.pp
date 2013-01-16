
class repo_centos::remove {

# require repo_centos::install

  file { 'rm_CentOS-Base.repo':      ensure => absent, path => '/etc/yum.repos.d/CentOS-Base.repo',      }
# file { 'rm_CentOS-Media.repo':     ensure => absent, path => '/etc/yum.repos.d/CentOS-Media.repo',     }

  file { 'rm_CentOS-Debuginfo.repo': ensure => absent, path => '/etc/yum.repos.d/CentOS-Debuginfo.repo', }
  file { 'rm_CentOS-Vault.repo':     ensure => absent, path => '/etc/yum.repos.d/CentOS-Vault.repo',     }

  file { 'rm_CentOS-Contrib.repo':   ensure => absent, path => '/etc/yum.repos.d/CentOS-Contrib.repo',   }
  file { 'rm_CentOS-Extras.repo':    ensure => absent, path => '/etc/yum.repos.d/CentOS-Extras.repo',    }
  file { 'rm_CentOS-Plus.repo':      ensure => absent, path => '/etc/yum.repos.d/CentOS-Plus.repo',      }
  file { 'rm_CentOS-Updates.repo':   ensure => absent, path => '/etc/yum.repos.d/CentOS-Updates.repo',   }

}

# vim:ft=puppet:

