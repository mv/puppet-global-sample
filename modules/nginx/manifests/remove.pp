
class nginx::remove {

  require nginx::params

  # Best order:
  Package['nginx'] -> User['nginx'] -> Group['nginx']

  package { 'nginx':
    ensure => absent,
    name   => $nginx::params::pkg_name,
  }

  user  { 'nginx': ensure => absent, }
  group { 'nginx': ensure => absent, }

} # class

# vim:ft=puppet:

