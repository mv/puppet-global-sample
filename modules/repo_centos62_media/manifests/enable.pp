
class repo_centos62_media::enable {

  yumrepo { 'c5_media':
    name     => 'CentOS-Media',
    enabled  => 1,
  }

} # class

# vim:ft=puppet:

