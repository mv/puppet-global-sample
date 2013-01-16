
class icinga::gui::remove {

  require icinga::params

  # notify apache 'service'
  include apache::install

  package { 'icinga-gui':
    ensure  => absent,
  }

  package { 'icinga-gui-depend':
    ensure  => absent,
    name    => $icinga::params::pkg_gui_dependencies,
    require => Package['icinga-gui']
  }

  File { require => Package ['icinga-gui'] }

  ### Directories
# file {'/usr/lib64/icinga/cgi':         ensure  => absent, force => true }
# file {'/usr/share/icinga/contexthelp': ensure  => absent, force => true }
# file {'/usr/share/icinga/images':      ensure  => absent, force => true }
# file {'/usr/share/icinga/js':          ensure  => absent, force => true }
# file {'/usr/share/icinga/ssi':         ensure  => absent, force => true }
# file {'/usr/share/icinga/stylesheets': ensure  => absent, force => true }

  ### Files
# file {'/etc/httpd/conf.d/icinga.conf': ensure => absent }
# file {'/etc/icinga/cgi.cfg':           ensure => absent }
# file {'/etc/icinga/cgiauth.cfg':       ensure => absent }

} # class

# vim:ft=puppet:

