
class apache::remove {

# require repo_abril

  require apache::params

  exec { 'rm_httpd_conf':
    command   => '/bin/rm -rf *conf* *enable*',
    cwd       => '/etc/httpd/',
    path      => '/usr/local/bin:/usr/bin:/bin',
    logoutput => on_failure,
    onlyif    => '/bin/ls *conf* *enable*',
    user      => 'root',
    group     => 'root',
    require   => Package['apache'],
  }

# exec { 'rm_httpd_conf.d':
#   command   => '/bin/rm conf.d/*conf',
#   cwd       => '/etc/httpd/',
#   path      => '/usr/local/bin:/usr/bin:/bin',
#   logoutput => on_failure,
#   onlyif    => 'ls conf.d/*conf',
#   user      => 'root',
#   group     => 'root',
#   require   => Package['apache'],
# }

  package { 'apache':
    ensure  => absent,
    require => Service['apache'],
  }

  service { 'apache':
    ensure  => stopped,
    name    => $apache::params::service_name,
  }

# file {'/etc/httpd/httpd.conf': ensure => absent, require => Package['apache'], }
# file {'/etc/httpd/conf':       ensure => absent, require => Package['apache'], }
# file {'/etc/httpd/conf.d':     ensure => absent, require => Package['apache'], }

} # class

# vim:ft=puppet:

