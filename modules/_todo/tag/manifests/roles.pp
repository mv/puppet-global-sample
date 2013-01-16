
class tag::roles {

  notice("tag_roles = [${::tag_roles}]")

  ###
  ### Define "${tag::roles::name}" as a hash
  ###

  # to verify if a role exists anywhere in the catalog:
  #
  #    if $tag::roles::have['role_name'] {
  #        include my-action-1
  #        include my-action-2
  #        include my-action-3
  #    }
  #
  #    if $tag::roles::have['db']  { notice("Role db ok") }
  #    if $tag::roles::have['ws']  { notice("Role ws ok") }
  #    if $tag::roles::have['api'] { notice("Role api ok") }

  ###
  ### $have is a HASH!!!!!!
  ###
# $have = { db => true, api => true, ws => true }
  $have = sep_to_hash( $::tag_roles )


} # end class

# vim:ft=puppet

