
class repo_epel::remove {

  ###
  file { '/etc/yum.repos.d/epel.repo':                   ensure => absent, }
  file { '/etc/yum.repos.d/epel-testing.repo':           ensure => absent, }
  file { '/etc/yum.repos.d/epel-testing-debuginfo.repo': ensure => absent, }
  file { '/etc/yum.repos.d/epel-testing-source.repo':    ensure => absent, }

}

# vim:ft=puppet

