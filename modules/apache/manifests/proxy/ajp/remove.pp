class apache::proxy::ajp::remove {

# require apache::params

  ### reuse 'service' definition
  include apache::install

  file {'/etc/httpd/conf/httpd-proxy-ajp.conf':
    ensure  => absent,
    notify  => Service['httpd'],
  }

} # class

# vim:ft=puppet:

