
class foo::install {

# require repo_abril

  require foo::params

  package { 'foo':
    ensure  => installed,
    name    => $foo::params::pkg_name,
  }

  file { 'foo.conf':
    ensure  => present,
    path    => $foo::params::config_file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/foo/foo.conf',
    require => Package['foo'],
  }

} # class

# foo:ft=puppet:

