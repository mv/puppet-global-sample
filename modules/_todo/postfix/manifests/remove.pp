
class postfix::remove {

  # Load variables defined in params.pp file.
  require postfix::params

  package { 'postfix':
    ensure  => absent,
    name    => $postfix::params::pkg_name,
    require => Service['postfix'],
  }

  service { 'postfix':
    ensure => stopped,
    name   => $postfix::params::service_name,
  }

} # class

# vim:ft=puppet:

