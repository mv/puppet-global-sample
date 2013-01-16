
class cron::remove {

  require cron::params

  # notify 'service'
# include apache::install
# File { notify  => Service['httpd'], }

  # Best order:
  Package['cron'] -> User['cron'] -> Group['cron']

  package { 'cron':
    ensure => absent,
    name   => $cron::params::pkg_name,
  }

  user  { 'cron': ensure => absent, }
  group { 'cron': ensure => absent, }

} # class

# vim:ft=puppet:

