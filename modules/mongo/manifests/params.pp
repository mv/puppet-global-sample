
class mongo::params {


  case $::operatingsystem {

    /RedHat|CentOS/ : {

      $pkg_name_client = 'mongo-10gen'
      $pkg_name_server = 'mongo-10gen-server'

      $config_dir   = '/etc'
      $config_file  = '/etc/mongod.conf'

      $init_file    = '/etc/init.d/mongod'
      $sysconf_file = '/etc/sysconfig/mongod'
#     $rotate_cfg   = '/etc/logrotate.d/mongod'

      $service_name = 'mongod'
      $service_port = 27017
      $web_port     = 28017
      $protocol     = 'tcp'

      $process_name = 'mongod'
      $pid_file     = '/var/run/mongo/mongod.pid'
      $has_status   = true

    }

#   /Debian|Ubuntu/ : {
#
#   }

    default : {
      notice("Unsupported operating system: ${::operatingsystem}")
    }

  } # case

} # class

# vim:ft=puppet:

