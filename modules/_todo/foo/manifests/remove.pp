
class foo::remove {

  require foo::params

  package { 'foo':
    ensure => absent,
    name   => $foo::params::pkg_name,
  }

  package { 'foo_dependencies':
    ensure  => absent,
    name    => $foo::params::pkg_dependencies,
    require => Package['foo'],
  }

  file { 'foo.conf':
    ensure  => absent,
    path    => $foo::params::config_file,
  }

} # class

# foo:ft=puppet:

