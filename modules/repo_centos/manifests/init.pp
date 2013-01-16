
class repo_centos {

  include motd
  motd::register{ $module_name : }

  ### Default action: install
  include repo_centos::install

}

# vim:ft=puppet:

