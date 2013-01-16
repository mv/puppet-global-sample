
class icinga::remove {

  require icinga::params

  # notify 'service'
# include apache::install
# File { notify  => Service['httpd'], }

  package { 'icinga':
    ensure => absent,
    name   => $icinga::params::pkg_name,
  }

# package { $icinga::params::pkg_dependencies :
#   ensure    => absent,
#   subscribe => Package['icinga'],
# }


} # class

# vim:ft=puppet:

