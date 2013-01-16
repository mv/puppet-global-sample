
class repo_rpmforge {

  include motd
  motd::register{ $module_name : }

  # Ref:
  #    http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.2-2.el6.rf.x86_64.rpm

  require repo_rpmforge::install

}

# vim:ft=puppet:

