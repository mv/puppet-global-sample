class apache::ssl::remove {

  require apache::params

  ### reuse 'service' definition
  include apache::install

  file {'/etc/httpd/conf/httpd-ssl.conf':
    ensure  => absent,
    notify  => Service['httpd'],
    require => Package['mod_ssl'],
  }

  package { 'mod_ssl':
    ensure  => absent,
  }

} # class

# vim:ft=puppet:

