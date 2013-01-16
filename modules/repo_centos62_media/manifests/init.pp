
class repo_centos62_media {

  include motd
  motd::register{ $module_name : }

  ### Default action: install
  include repo_centos62_media::install

} # class

# vim:ft=puppet:

