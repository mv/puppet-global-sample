
class mytop::remove::all {

  package { 'mytop':               ensure => absent, }
  file    { '/etc/skel/dot.mytop': ensure => absent, }
  file    { '/root/dot.mytop':     ensure => absent, }
  file    { '/root/.mytop':        ensure => absent, }

} # class

# vim:ft=puppet:

