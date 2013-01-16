
class java::jre::install {

  require java::params

  package { 'java_jre':
    ensure => present,
    name   => $java::params::jre_name,
  }

}

# vim:ft=puppet

