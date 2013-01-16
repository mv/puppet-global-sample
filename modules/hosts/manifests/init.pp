class hosts {

  ###
  ### Keep it accessible
  ###
  file { 'hosts':
    ensure  => present,
    path    => '/etc/hosts',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

} # end class

# vim:ft=puppet:

