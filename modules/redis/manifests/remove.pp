
class redis::remove {

  require redis::params

  # Best order:
  Package['redis'] -> User['redis'] -> Group['redis']

  package { 'redis':
    ensure => absent,
    name   => $redis::params::pkg_name,
  }

  user  { 'redis': ensure => absent, }
  group { 'redis': ensure => absent, }

} # class

# vim:ft=puppet:

