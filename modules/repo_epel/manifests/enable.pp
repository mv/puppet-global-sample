
class repo_epel::enable {

  ### Obs: 'Testing' is ALWAYS disabled
  yumrepo { 'epel':                   name => 'epel',                   enabled => 1, }
  yumrepo { 'epel-testing':           name => 'epel-testing',           enabled => 0, }
  yumrepo { 'epel-testing-debuginfo': name => 'epel-testing-debuginfo', enabled => 0, }
  yumrepo { 'epel-testing-source':    name => 'epel-testing-source',    enabled => 0, }

}

# vim:ft=puppet

