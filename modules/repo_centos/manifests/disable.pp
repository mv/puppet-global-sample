
class repo_centos::disable {

  yumrepo { 'base':
    name       => 'CentOS-Base',
    descr      => 'CentOS-$releasever - Base',
    enabled    => 0,
  }

  yumrepo { 'updates':
    name       => 'CentOS-Updates',
    descr      => 'CentOS-$releasever - Updates',
    enabled    => 0,
  }

  yumrepo { 'extras':
    name       => 'CentOS-Extras',
    descr      => 'CentOS-$releasever - Extras',
    enabled    => 0,
  }

  yumrepo { 'centosplus':
    name       => 'CentOS-Plus',
    descr      => 'CentOS-$releasever - Plus',
    enabled    => 0,
  }

  yumrepo { 'contrib':
    name       => 'CentOS-Contrib',
    descr      => 'CentOS-$releasever - Contrib',
    enabled    => 0,
  }

  yumrepo { 'debug':
    name       => 'CentOS-Debuginfo',
    descr      => 'CentOS-$releasever - Debuginfo',
    enabled    => 0,
  }

} # class

# vim:ft=puppet:

