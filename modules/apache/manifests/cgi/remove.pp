class apache::cgi::remove {

# require apache::params

  ### reuse 'service' definition
  include apache::install

  file {'/etc/httpd/conf/httpd-cgi.conf':
    ensure => absent,
    notify => Service['httpd'],
  }

  file {'/var/www/cgi-bin':
    ensure => absent,
    force  => true,
  }

} # class

# vim:ft=puppet:

