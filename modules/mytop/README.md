# Puppet: mytop


Mytop: mysql top utility

This module depends on repo_eden_rpm.


### Usage

##### mytop

    # install
    include mytop
    include mytop::install

    # remove
    include mytop::remove
    include mytop::remove::all  # remove also dot.mytop files

##### Depends on

     include repo_eden_rpm

### itens created

    /etc/skel/dot.mytop
    /root/dot.mytop


# vim:ft=markdown

