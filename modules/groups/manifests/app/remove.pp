
class groups::app::remove {

  group { 'app': ensure => absent, }

}

# vim:ft=puppet

