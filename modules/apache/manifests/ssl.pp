class apache::ssl {

  require apache::params

  ### reuse 'service' definition
  include apache::install

  file {'/etc/httpd/conf/httpd-ssl.conf':
    ensure  => present,
    source  => 'puppet:///modules/apache/conf/httpd-ssl.conf',
    notify  => Service['httpd'],
    require => Package['mod_ssl'],
  }

  package { 'mod_ssl':
    ensure  => present,
    require => Package['httpd'],
  }

  ### from rpm: remove
  file {'/etc/httpd/conf.d/ssl.conf':
    ensure  => absent,
  }

} # class

# vim:ft=puppet:

