
class repo_centalt::disable {

  yumrepo { 'centalt': name => 'centalt', enabled => 0, }

}

# vim:ft=puppet

