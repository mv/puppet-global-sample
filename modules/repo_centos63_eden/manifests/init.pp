
class repo_centos63_eden {

  include motd
  motd::register{ $module_name : }

  ### Default action: install
  include repo_centos63_eden::install

} # class

# vim:ft=puppet:

