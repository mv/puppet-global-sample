
class java::jdk::remove {

  require java::params

  package { 'java_jdk':
    ensure => absent,
    name   => $java::params::jdk_name,
  }

}

# vim:ft=puppet

