
class memcached {

  # Parameters by operating system
  require memcached::params

  # Default: install
  include memcached::install
}

# vim:ft=puppet:

