
class repo_centos62_eden {

  include motd
  motd::register{ $module_name : }

  ### Default action: install
  include repo_centos62_eden::install

} # class

# vim:ft=puppet:

