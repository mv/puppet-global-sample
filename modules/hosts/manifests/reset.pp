class hosts::reset {

  ###
  ### /etc/hosts: restart all over again
  ###
  host { 'localhost':
    ensure       => present,
    ip           => '127.0.0.1',
    name         => 'localhost.localdomain',
    host_aliases => [ 'localhost' , 'localhost4', 'localhost4.localdomain4'],
  }

  host { 'localhost6':
    ensure       => present,
    ip           => '::1',
    name         => 'localhost6.localdomain6',
    host_aliases => [ 'localhost6', 'localhost6', 'localhost6.localdomain6'],
  }

} # end class

# vim:ft=puppet:

