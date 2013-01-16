# Puppet: java

Java Packages

This module runs based on the following pre-requisites:

* Packages are downloaded from Oracle site.
* Packages are opened and its .rpm file extracted.
* RPM file is renamed to match package as shown by 'rpm -qa'
* All .rpm files are uploaded to our local rpm repo: eden_rpm.


### Usage

    # install
    include java            # default: install jre only
    include java::install

    include java::jre::install
    include java::jdk::install

    # remove
    include java::remove    # default: remove jre AND jdk
    include java::jre::remove
    include java::jdk::remove


# vim:ft=markdown:

