class hosts::myself {

  ###
  ### myself !!!
  ###
  host { $::hostname :
    ensure       => present,
    ip           => $::ipaddress ,
    name         => $::hostname  ,
    host_aliases => "${::hostname}.local"
  }

} # end class

# vim:ft=puppet:

