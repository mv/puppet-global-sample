
class icinga::api::remove {

# require icinga
  require icinga::params

  # notify apache 'service'
# include apache::install

  package { 'icinga-api':
    ensure  => absent,
    name    => $icinga::params::pkg_api,
  }

  file {'/var/log/icinga/api':
    ensure  => absent,
    force   => true,
    require => Package['icinga-api']
  }


} # class

# vim:ft=puppet:

