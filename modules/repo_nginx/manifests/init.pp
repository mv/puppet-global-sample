
class repo_nginx {

  include motd
  motd::register{ $module_name : }

  ### Default action: install
  include repo_nginx::install

} # class

# vim:ft=puppet:

