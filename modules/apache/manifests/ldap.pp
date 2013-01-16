class apache::ldap {

# require repo_abril

  require apache::params

  ### reuse 'service' definition
  include apache::install

  file {'/etc/httpd/conf/httpd-ldap.conf':
    ensure => present,
    source => 'puppet:///modules/apache/conf/httpd-ldap.conf',
    notify => Service['httpd'],
  }

} # class

# vim:ft=puppet:

