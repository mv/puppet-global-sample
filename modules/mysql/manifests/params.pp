
# Ref:
#   http://linorg.usp.br/mysqlDownloads/MySQL-5.5/MySQL-client-5.5.21-1.rhel5.x86_64.rpm
#   http://linorg.usp.br/mysqlDownloads/MySQL-5.5/MySQL-server-5.5.21-1.rhel5.x86_64.rpm
#   http://linorg.usp.br/mysqlDownloads/MySQL-5.5/MySQL-devel-5.5.21-1.rhel5.x86_64.rpm
#   http://linorg.usp.br/mysqlDownloads/MySQL-5.5/MySQL-shared-5.5.21-1.rhel5.x86_64.rpm
#   http://linorg.usp.br/mysqlDownloads/MySQL-5.5/MySQL-shared-compat-5.5.21-1.rhel5.x86_64.rpm
#   http://linorg.usp.br/mysqlDownloads/MySQL-5.5/MySQL-embedded-5.5.21-1.rhel5.x86_64.rpm
#   http://linorg.usp.br/mysqlDownloads/MySQL-5.5/MySQL-test-5.5.21-1.rhel5.x86_64.rpm

class mysql::params {

  ### Obs:
  ###     {client,server}_dependencies: pre-req on install
  ###     depend_on_{client,server}:    pre-req on remove

  case $::operatingsystem {

    /RedHat|CentOS/ : {
      $pkg_name_client     = 'MySQL-client'
      $client_dependencies = ''
      $depend_on_client    = 'perl-DBD-MySQL'

      $pkg_name_server     = 'MySQL-server'
      $server_dependencies = 'libaio'
      $depend_on_server    = ''

      $pkg_name_devel = 'MySQL-devel'
      $config_file    = '/etc/my.cnf'
    }

    /Debian|Ubuntu/ : {
      $pkg_name_client     = 'mysql-client'
      $client_dependencies = ''
      $depend_on_client    = ''

      $pkg_name_server     = 'mysql-server'
      $server_dependencies = ''
      $depend_on_server    = ''

      $pkg_name_devel = 'mysql-devel'
      $config_file    = '/etc/mysql/my.cnf'
    }

    default : {
      $pkg_name_client     = 'mysql-client'
      $client_dependencies = ''
      $depend_on_client    = ''

      $pkg_name_server     = 'mysql-server'
      $server_dependencies = ''
      $depend_on_server    = ''

      $pkg_name_devel = 'mysql-devel'
      $config_file    = '/etc/my.cnf'
    }

  } # case

} # class

# vim:ft=puppet:

