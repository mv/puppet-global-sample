
class repo_centalt {

  include motd
  motd::register{ $module_name : }

  ### Default action: install
  include repo_centalt::install

} # class

# vim:ft=puppet

