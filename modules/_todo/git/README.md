# Puppet: git


Git command line

This module depends on repo_eden_rpm.


### Usage

##### git

    # install
    include git
    include git::install

    # remove
    include git::remove

    # user
    include git::user
    include git::user::install
    include git::user::remove

##### Depends on

     include repo_eden_rpm

### itens created

    /etc/gitconfig
    /etc/skel/dot.gitconfig


# vim:ft=markdown

