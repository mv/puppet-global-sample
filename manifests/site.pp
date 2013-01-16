

node default {

  include base

  ###
  ### enforce env variables defined by FACTER_tag_{variable}
  ###
  include base::rules

  include tag::classes
  include tag::roles

}

# vim:ft=puppet

