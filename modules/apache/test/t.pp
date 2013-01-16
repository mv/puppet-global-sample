

  class {'apache::tuning':
    p_Timeout              => '300',
    ### 'KeepAlive'
    p_KeepAlive            => 'On' ,
    p_MaxKeepAliveRequests => '100',
    p_KeepAliveTimeout     => '5',
    ### prefork
    p_ServerLimit          => '2048',
    p_MaxClients           => '1024',
    p_MaxRequestsPerChild  => '10240',
    p_StartServers         => '5',
    p_MinSpareServers      => '55',
    p_MaxSpareServers      => '100',
  }

# vim:ft=puppet:

