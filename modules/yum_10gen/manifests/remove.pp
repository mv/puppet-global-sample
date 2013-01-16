
class yum_10gen::remove {

  file { '/etc/yum.repos.d/10gen.repo': ensure => absent, }

}


# vim:ft=puppet

