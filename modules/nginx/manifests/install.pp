class nginx::install {

  require repo_eden_rpm
# require repo_nginx

  require nginx::user

  ###
  ### variables for template usage
  ### Reference:
  ###    http://docs.puppetlabs.com/guides/templating.html
  ###

  $pkg_name     = $nginx::params::pkg_name
  $process_name = $nginx::params::process_name
  $pid_file     = $nginx::params::pid_file
  $init_file    = $nginx::params::init_file
  $service_name = $nginx::params::service_name
  $service_port = $nginx::params::service_port

  ###
  ### Install/enforce
  ###

  package { 'nginx':
    ensure  => installed,
    name    => $nginx::params::pkg_name,
  }

  service { 'nginx':
    ensure     => running,
    name       => $nginx::params::service_name,
    enable     => true,
    hasrestart => true,
    hasstatus  => $nginx::params::has_status,
    pattern    => $nginx::params::process_name,
    require    => Package['nginx'],
    subscribe  => [ File[ $nginx::params::config_file ] ,
                    File[ $nginx::params::conf_file   ]
                  ]
  }

  ###
  ### Directories,files
  ###

  ### nginx-1.2.3
  ### rpm -qlv nginx | column -t  # {
  # -rw-r--r--  1  root  root  302     Aug  7  13:19  /etc/logrotate.d/nginx
  # drwxr-xr-x  2  root  root  0       Aug  7  13:22  /etc/nginx
  # drwxr-xr-x  2  root  root  0       Aug  7  13:22  /etc/nginx/conf.d
  # -rw-r--r--  1  root  root  1097    Aug  7  13:19  /etc/nginx/conf.d/default.conf
  # -rw-r--r--  1  root  root  454     Aug  7  13:19  /etc/nginx/conf.d/example_ssl.conf
  # -rw-r--r--  1  root  root  964     Aug  7  13:22  /etc/nginx/fastcgi_params
  # -rw-r--r--  1  root  root  2837    Aug  7  13:22  /etc/nginx/koi-utf
  # -rw-r--r--  1  root  root  2223    Aug  7  13:22  /etc/nginx/koi-win
  # -rw-r--r--  1  root  root  3463    Aug  7  13:22  /etc/nginx/mime.types
  # -rw-r--r--  1  root  root  643     Aug  7  13:19  /etc/nginx/nginx.conf
  # -rw-r--r--  1  root  root  596     Aug  7  13:22  /etc/nginx/scgi_params
  # -rw-r--r--  1  root  root  623     Aug  7  13:22  /etc/nginx/uwsgi_params
  # -rw-r--r--  1  root  root  3610    Aug  7  13:22  /etc/nginx/win-utf
  # -rwxr-xr-x  1  root  root  2776    Aug  7  13:22  /etc/rc.d/init.d/nginx
  # -rw-r--r--  1  root  root  98      Aug  7  13:19  /etc/sysconfig/nginx
  # -rwxr-xr-x  1  root  root  832480  Aug  7  13:22  /usr/sbin/nginx
  # drwxr-xr-x  2  root  root  0       Aug  7  13:22  /usr/share/nginx
  # drwxr-xr-x  2  root  root  0       Aug  7  13:22  /usr/share/nginx/html
  # -rw-r--r--  1  root  root  383     Aug  7  13:22  /usr/share/nginx/html/50x.html
  # -rw-r--r--  1  root  root  151     Aug  7  13:22  /usr/share/nginx/html/index.html
  # drwxr-xr-x  2  root  root  0       Aug  7  13:22  /var/cache/nginx
  # drwxr-xr-x  2  root  root  0       Aug  7  13:22  /var/log/nginx
    # }

  File { owner => 'root', group => 'root', mode => '0644', require => Package['nginx'] }

  ### Directories
  file {'/etc/nginx':         ensure => directory , }
  file {'/etc/nginx/charset': ensure => directory , } # this is extra. mvf.
  file {'/etc/nginx/conf':    ensure => directory , } # this is extra. mvf.
  file {'/etc/nginx/conf.d':  ensure => directory , }
  file {'/usr/share/nginx':   ensure => directory , }
  file {'/var/cache/nginx':   ensure => directory , }
  file {'/var/log/nginx':     ensure => directory , }

  ###
  ### Originals
  ###
  file { '/etc/nginx/nginx.conf':     ensure => present, source => 'puppet:///modules/nginx/original/nginx.conf'     }
  file { '/etc/nginx/mime.types':     ensure => present, source => 'puppet:///modules/nginx/original/mime.types'     }
  file { '/etc/nginx/fastcgi_params': ensure => present, source => 'puppet:///modules/nginx/original/fastcgi_params' }
  file { '/etc/nginx/scgi_params':    ensure => present, source => 'puppet:///modules/nginx/original/scgi_params'    }
  file { '/etc/nginx/uwsgi_params':   ensure => present, source => 'puppet:///modules/nginx/original/uwsgi_params'   }

  ###
  ### Moving files
  ###
  file { '/etc/nginx/koi-utf': ensure => absent, }
  file { '/etc/nginx/koi-win': ensure => absent, }
  file { '/etc/nginx/win-utf': ensure => absent, }

  file { '/etc/nginx/charset/koi-utf': ensure => present, source => 'puppet:///modules/nginx/original/koi-utf' }
  file { '/etc/nginx/charset/koi-win': ensure => present, source => 'puppet:///modules/nginx/original/koi-win' }
  file { '/etc/nginx/charset/win-utf': ensure => present, source => 'puppet:///modules/nginx/original/win-utf' }



  ###
  ### Conf
  ###
  file { $nginx::params::config_file :
    ensure => present,
    source => 'puppet:///modules/nginx/nginx.sysconfig.sh',
    notify => Service['nginx']
  }

  file { $nginx::params::init_file :
    ensure => present,
    mode   => '0755',
    source => 'puppet:///modules/nginx/nginx.init.sh',
  }

  file { $nginx::params::rotate_cfg :
    ensure => present,
    source => 'puppet:///modules/nginx/nginx.logrotate',
  }

  file { $nginx::params::monit_cfg :
    ensure  => present,
    content => template('nginx/nginx.monit.conf.erb'),
  }

# file { $nginx::params::conf_file :
#   ensure => present,
#   source => 'puppet:///modules/nginx/nginx.conf',
# }


} # class

# vim:ft=puppet:

