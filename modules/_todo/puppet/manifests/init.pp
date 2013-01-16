
class puppet {

  include puppet::user

  file { ['/etc/puppet',
          '/etc/puppet/manifests',
          '/etc/puppet/modules',
          '/var/lib/puppet', ]:
    ensure  => directory,
    owner   => 'puppet',
    group   => 'puppet',
    mode    => '0664',
    recurse => true,
  }

}

# vim:ft=puppet:

