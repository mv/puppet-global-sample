#!/bin/bash
#
# provision-vagrant.sh
#
#
# Marcus Vinicius Fereira            ferreira.mv[ at ].gmail.com
# 2012-09
#

usage() {
    echo
    echo "Usage: $0 -f"
    echo
    echo "    Startup a vagrant box"
    echo
    exit 2
}

[ "$1" != "-f" ] && usage

log=/tmp/pp-prov-vagrant.log

cat > /tmp/Vagrantfile <<EOF
Vagrant::Config.run do |config|

  config.vm.box = 'centos62-base-03-4.1.22'
  config.vm.provision :shell, :inline => "/bin/rm -f /etc/yum.repos.d/CentOS-Media.repo ; /usr/bin/puppet apply -e 'include base'"

end
EOF

cd /tmp
vagrant destroy -f
vagrant up 2>&1 | tee -a $log
vagrant destroy -f

# 0: found       - egrep 'string' /tmp/1.log && echo 'found'
# 1: not found   - egrep 'string' /tmp/1.log || echo 'notfound'
if egrep -i 'warning|error' $log > /dev/null
then
    printf "\n\nProvision: FAILED.\n\n"
    err=1
else
    printf "\n\nProvision: ok\n\n"
    err=0
fi

# Reset log
> $log

#cho "log: $log"
#cho "err: $err"
exit $err

# vim:ft=sh:

