#!/bin/bash

###
### ATTENTION! ATTENTION! ATTENTION!
###     This file is managed by Puppet.
###     Any local modifications will be lost in the next puppet run.
### ATTENTION! ATTENTION! ATTENTION!
###

/usr/bin/puppet agent -t && exit 0 || exit 1

