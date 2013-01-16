
class git::remove {

  package { 'git': ensure => absent, }

} # class

# vim:ft=puppet:

