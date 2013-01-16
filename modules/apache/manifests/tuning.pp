class apache::tuning (
    $p_Timeout               = '300',
    ### 'KeepAlive'
    $p_KeepAlive             = 'On' ,
    $p_MaxKeepAliveRequests  = '100',
    $p_KeepAliveTimeout      = '5',
    ### 'all MPMs'
    $p_StartServers          = '5',
    $p_ServerLimit           = '2048',
    $p_MaxClients            = '1024',
    $p_MaxRequestsPerChild   = '10240',
    ### 'prefork MPM'
    $p_MinSpareServers       = '55',
    $p_MaxSpareServers       = '100',
    ### 'worker MPM'
    $p_MinSpareThreads       = '5',
    $p_MaxSpareThreads       = '10',
    $p_ThreadsPerChild       = '25'
) {

# require apache::params

  # touch definition of 'service'
  include apache::install

  ###
  ### Itens in template: httpd-tuning.conf.erb
  ###     <%= p_Param || default_value %>
  ###

  file {'/etc/httpd/conf/httpd-tuning.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['httpd'],
    notify  => Service['httpd'],
    content => template('apache/httpd-tuning.conf.erb'),
  }

} # class

# vim:ft=puppet:

