
class repo_puppet {

  include motd
  motd::register{ $module_name : }

  include repo_puppet::install

}


# vim:ft=puppet

