# Puppet: yum_virtualbox

Virtualbox rpm packages


### References

  * http://download.virtualbox.org/virtualbox/4.1.22/VirtualBox-4.1-4.1.22_80657_el6-1.x86_64.rpm
  * http://download.virtualbox.org/virtualbox/4.1.22/Oracle_VM_VirtualBox_Extension_Pack-4.1.22.vbox-extpack
  * http://download.virtualbox.org/virtualbox/4.1.22/VBoxGuestAdditions_4.1.22.iso
  * http://download.virtualbox.org/virtualbox/rpm/el/6/x86_64/
  * http://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo
  * http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc

### Usage

    # install
    include yum_virtualbox
    include yum_virtualbox::install

    # install, but keep it disabled
    include yum_virtualbox::install::disable

    # remove
    include yum_virtualbox::remove

    # others
    include yum_virtualbox::enable
    include yum_virtualbox::disable


# vim:ft=markdown:

