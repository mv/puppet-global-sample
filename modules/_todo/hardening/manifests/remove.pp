
class hardening::remove {

  require hardening::params

  package { 'hardening':
    ensure => absent,
    name   => $hardening::params::pkg_name,
  }

  package { 'hardening_dependencies':
    ensure  => absent,
    name    => $hardening::params::pkg_dependencies,
    require => Package['hardening'],
  }

  file { 'hardening.conf':
    ensure  => absent,
    path    => $hardening::params::config_file,
  }

} # class

# hardening:ft=puppet:

