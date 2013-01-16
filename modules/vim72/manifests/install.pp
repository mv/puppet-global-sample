
class vim72::install {

# require repo_eden_rpm

  require vim72::params

  package { 'vim':
    ensure  => installed,
    name    => $vim72::params::pkg_name,
    require => Package[ 'vim_depends_on' ]
  }

  package { 'vim_depends_on':
    ensure  => installed,
    name    => $vim72::params::depends_on,
  }

  ###
  ### Conf
  ###
  file { 'vimrc':
    ensure  => present,
    path    => $vim72::params::config_file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/vim72/vimrc',
    require => Package['vim'],
  }

  file { 'virc':
    ensure  => link,
    name    => '/etc/virc',
    target  => $vim72::params::config_file,
    force   => true,
    require => Package['vim'],
  }

  ###
  ### Extras
  ###
  file { '/usr/bin/vi':
    ensure  => link,
    name    => '/usr/bin/vi',
    target  => '/usr/bin/vim',
    force   => true,
    require => Package['vim'],
  }

  file { 'wombat256mod':
    ensure  => present,
    path    => '/usr/share/vim/vim72/colors/wombat256mod.vim',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/vim72/wombat256mod.vim',
    require => Package['vim'],
  }

}

# vim:ft=puppet:

