
class vim72::remove {

  require vim72::params

  package { 'vim':
    ensure => absent,
    name   => $vim72::params::pkg_name,
  }

  package { 'vim_dependencies':
    ensure  => absent,
    name    => $vim72::params::depends_on,
    require => Package['vim'],
  }

  file { 'vimrc':
    ensure  => absent,
    path    => $vim72::params::config_file,
  }
  file { '/etc/virc':   ensure  => absent, }
  file { '/usr/bin/vi': ensure  => absent, }

}

# vim:ft=puppet:

