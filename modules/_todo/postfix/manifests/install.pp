
class postfix::install {

  # Load variables defined in params.pp file.
  require postfix::params

  # Register
# motd::register{ 'postfix' : }

  # Package/Service/File tripplet
  package { 'postfix':
    ensure => present,
    name   => $postfix::params::pkg_name,
  }

  service { 'postfix':
    ensure     => running,
    name       => $postfix::params::service_name,
    enable     => true,
    hasrestart => true,
    hasstatus  => $postfix::params::has_status,
    pattern    => $postfix::params::process_name,
    require    => Package['postfix'],
    subscribe  => File['main.cf'],
  }

  ###
  ### Config files
  ###

  $config_dir  = $postfix::params::config_dir
  $config_file = $postfix::params::config_file

  $smtp = hiera('smtp','localhost')

  file { 'main.cf':
    ensure  => present,
    path    => "${config_dir}/${config_file}",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['postfix'],
    notify  => Service['postfix'],
    source  => "puppet:///modules/postfix/main.cf.${smtp}",
  }

} # class

# vim:ft=puppet:

