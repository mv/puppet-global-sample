
class repo_centos::enable {

  yumrepo { 'base':
    name       => 'CentOS-Base',
    descr      => 'CentOS-$releasever - Base',
    enabled    => 1,
  }

# yumrepo { 'updates':
#   name       => 'CentOS-Updates',
#   descr      => 'CentOS-$releasever - Updates',
#   enabled    => 1,
# }

} # class

# vim:ft=puppet:

