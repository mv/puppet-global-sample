
class repo_centos62_media::remove {

  file  { 'rm_CentOS-Media':
    ensure => absent,
    path   => '/etc/yum.repos.d/CentOS-Media.repo',
  }

# mount { '/media/cdrom': ensure => unmounted, }

} # class

# vim:ft=puppet:

