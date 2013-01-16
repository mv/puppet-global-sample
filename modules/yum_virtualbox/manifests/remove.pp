
class yum_virtualbox::remove {

  file { '/etc/yum.repos.d/virtualbox.repo': ensure => absent, }

}


# vim:ft=puppet

