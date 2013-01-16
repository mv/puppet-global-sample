class apache::install {

# require repo_abril

  require apache::params

  package { 'httpd':
    ensure  => installed,
    name    => $apache::params::pkg_name,
  }

  service { 'httpd':
    ensure     => running,
    name       => $apache::params::service_name,
    enable     => true,
    hasrestart => $apache::params::has_restart,
    hasstatus  => $apache::params::has_status,
    require    => Package['httpd']
  }

  File {
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['httpd'],
    notify  => Service['httpd'],
  }

  ###
  ### Directories
  ###
  file {'/etc/httpd':         ensure => directory }
  file {'/etc/httpd/conf':    ensure => directory }
  file {'/etc/httpd/conf.d':  ensure => directory }

  file {'/etc/httpd/mods-enabled':  ensure => link, target => '/etc/httpd/conf'   }
  file {'/etc/httpd/sites-enabled': ensure => link, target => '/etc/httpd/conf.d' }

  ###
  ### DocumentRoot
  ###
  file {'/var/www':         ensure => directory }
  file {'/var/www/error':   ensure => directory }
  file {'/var/www/htdocs':  ensure => directory }
  file {'/var/www/icons':   ensure => directory }
  file {'/var/www/conf':    ensure => link , target => '/etc/httpd/conf' }
  file {'/var/www/html':    ensure => link , target => '/var/www/htdocs' , force => true }
  file {'/var/www/logs':    ensure => link , target => '/var/log/httpd' }
  file {'/var/www/modules': ensure => link , target => '/usr/lib64/httpd/modules' }
  file {'/var/www/run':     ensure => link , target => '/var/run' }

  ###
  ### Dummy
  ###
  file {'/var/www/htdocs/index.html':  ensure => present, content => '<html>Test.<title>t</title></html>', }
  file {'/var/www/htdocs/robots.txt':  ensure => present, content => "User-agent: *\nDisallow: /\n\n", }

  ###
  ### Logs
  ###
  file {'/var/log/httpd':            ensure => directory }
  file {'/var/log/httpd/access.log': ensure => present }
  file {'/var/log/httpd/error.log':  ensure => present }

  ###
  ### Conf
  ###
  file {'/etc/httpd/httpd.conf':
    ensure  => present,
    content => template('apache/httpd.conf.erb'),
  }

  file {'/etc/httpd/conf/httpd.conf': ensure => link, target => '/etc/httpd/httpd.conf' }

  ###
  ### Default files
  ###
  file { $apache::params::init_config_file :
    ensure => present,
    source => 'puppet:///modules/apache/httpd.sysconfig.sh',
    mode   => '0755',
  }

  file {'/etc/httpd/conf/magic':                ensure => present, source => 'puppet:///modules/apache/default/magic'      }
  file {'/etc/httpd/conf/mime.types':           ensure => present, source => 'puppet:///modules/apache/default/mime.types' }

  file {'/etc/httpd/conf/httpd-auth.conf':      ensure => present, source => 'puppet:///modules/apache/default/httpd-auth.conf'}
  file {'/etc/httpd/conf/httpd-default.conf':   ensure => present, source => 'puppet:///modules/apache/default/httpd-default.conf'}
  file {'/etc/httpd/conf/httpd-deflate.conf':   ensure => present, source => 'puppet:///modules/apache/default/httpd-deflate.conf'}
  file {'/etc/httpd/conf/httpd-errordoc.conf':  ensure => present, source => 'puppet:///modules/apache/default/httpd-errordoc.conf'}
  file {'/etc/httpd/conf/httpd-hardening.conf': ensure => present, source => 'puppet:///modules/apache/default/httpd-hardening.conf'}
  file {'/etc/httpd/conf/httpd-info.conf':      ensure => present, source => 'puppet:///modules/apache/default/httpd-info.conf'}
  file {'/etc/httpd/conf/httpd-load.conf':      ensure => present, source => 'puppet:///modules/apache/default/httpd-load.conf'}
  file {'/etc/httpd/conf/httpd-log.conf':       ensure => present, source => 'puppet:///modules/apache/default/httpd-log.conf'}
  file {'/etc/httpd/conf/httpd-mime.conf':      ensure => present, source => 'puppet:///modules/apache/default/httpd-mime.conf'}
# file {'/etc/httpd/conf/httpd-tuning.conf':    ensure => present, source => 'puppet:///modules/apache/default/httpd-tuning.conf'}

  ###
  ### Removing from rpm install
  ###
  file {'/etc/httpd/conf.d/README':         ensure => absent }
  file {'/etc/httpd/conf.d/proxy_ajp.conf': ensure => absent }
  file {'/etc/httpd/conf.d/welcome.conf':   ensure => absent }

} # class

# vim:ft=puppet:

