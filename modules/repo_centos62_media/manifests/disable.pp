
class repo_centos62_media::disable {

  yumrepo { 'c5_media':
    name     => 'CentOS-Media',
    enabled  => 0,
  }

} # class

# vim:ft=puppet:

