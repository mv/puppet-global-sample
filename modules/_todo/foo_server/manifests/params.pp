
class foo_server::params {

  ### Obs:
  ###     {client,server}_dependencies: pre-req on install
  ###     depend_on_{client,server}:    pre-req on remove

  case $::operatingsystem {

    /RedHat|CentOS/ : {
      $pkg_name_client     = 'foo-client'
      $client_dependencies = ''
      $depend_on_client    = ''

      $pkg_name_server     = 'foo-server'
      $server_dependencies = ''
      $depend_on_server    = ''

      $pkg_name_devel = ''
      $config_file    = ''
    }

    /Debian|Ubuntu/ : {
      $pkg_name_client     = 'foo-client'
      $client_dependencies = ''
      $depend_on_client    = ''

      $pkg_name_server     = 'foo-server'
      $server_dependencies = ''
      $depend_on_server    = ''

      $pkg_name_devel = 'foo-devel'
      $config_file    = '/etc/foo.conf'
    }

    default : {
      $pkg_name_client     = 'foo-client'
      $client_dependencies = ''
      $depend_on_client    = ''

      $pkg_name_server     = 'foo-server'
      $server_dependencies = ''
      $depend_on_server    = ''

      $pkg_name_devel = 'foo-devel'
      $config_file    = '/etc/foo.conf'
    }

  } # case

} # class

# vim:ft=puppet:

