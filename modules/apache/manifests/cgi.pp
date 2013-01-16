class apache::cgi {

# require apache::params

  ### reuse 'service' definition
  include apache::install

  file {'/etc/httpd/conf/httpd-cgi.conf':
    ensure => present,
    source => 'puppet:///modules/apache/conf/httpd-cgi.conf',
    notify => Service['httpd'],
  }

  file {'/var/www/cgi-bin':
    ensure => directory,
  }

  file {'/var/www/cgi-bin/env.sh':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    source => 'puppet:///modules/apache/env.sh',
  }


} # class

# vim:ft=puppet:

