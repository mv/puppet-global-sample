
class java::jdk::install {

  require java::params

  package { 'java_jdk':
    ensure => present,
    name   => $java::params::jdk_name,
  }

}

# vim:ft=puppet

