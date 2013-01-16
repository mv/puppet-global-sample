
class yum_virtualbox {

  include motd
  motd::register{ $module_name : }

  include yum_virtualbox::install

}


# vim:ft=puppet

