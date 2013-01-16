
class tag::classes {

# require base

  ###
  ### Base classes
  ###

  #
  # include all classes by default defined by FACTER_tag_classes
  #
  $list = sep_to_array( $::tag_classes )
  tag::include_class{ $list: }

} # end class

# vim:ft=puppet

