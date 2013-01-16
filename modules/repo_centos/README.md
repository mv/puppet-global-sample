# Puppet: repo_centos

Using CentOS repo from http://mirror.centos.org

For better usage only _*base*_ is enabled. All other repositories are
forcibly disabled.

For reference, original itens are kept in _*files/*_ directory
in case of reverting to the original CentOS install.

### Usage

    # install
    include repo_centos
    include repo_centos::install

    # remove
    include repo_centos::remove

    # restore original files
    include repo_centos::original


# vim:ft=markdown:

