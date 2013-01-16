
class java::jre::remove {

  require java::params

  package { 'java_jre':
    ensure => absent,
    name   => $java::params::jre_name,
  }


}

# vim:ft=puppet

